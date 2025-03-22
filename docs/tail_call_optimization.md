# Tail Call Optimization

## 🚀 TCO Nedir?

**Tail Call Optimization (TCO)**, özyinelemeli fonksiyonların çalışma zamanı yığın (stack) bellek kullanımını optimize eden bir tekniktir. Bu optimizasyon, özyinelemeli çağrının fonksiyonun "son" işlemi olması durumunda çalışır.

## 🎯 Neden TCO Kullanırız?

1. **Yığın Taşmasını Önler**: Yüksek derinlikli özyinelemeli fonksiyonlar stack overflow hatası verebilir (özellikle büyük veri kümeleriyle çalışırken).
2. **Bellek Kullanımını Azaltır**: Her özyinelemeli çağrı için yeni bir stack frame oluşturmak yerine mevcut olanı yeniden kullanır.
3. **Performans İyileştirir**: Gereksiz call stack yönetimini ortadan kaldırarak performansı artırır.

## 💡 Nasıl Çalışır?

### Normal Özyineleme vs. Tail Call Özyineleme 

```elixir
# Normal özyineleme (TCO uygulanamaz)
def factorial(n) when n <= 1, do: 1
def factorial(n), do: n * factorial(n - 1)  # Özyineleme sonrası "çarpma" işlemi var

# Tail call özyineleme (TCO uygulanabilir)
def factorial_tco(n, acc \\ 1)
def factorial_tco(n, acc) when n <= 1, do: acc
def factorial_tco(n, acc), do: factorial_tco(n - 1, n * acc)  # "Son işlem" özyinelemedir
```

## 🛠️ Temel Prensipler

1. **Son Çağrı (Tail Call) Kriteri**: Özyinelemeli çağrı, fonksiyonun yaptığı "son işlem" olmalıdır. Çağrıdan sonra başka bir işlem yapılmamalıdır.

2. **Durum Aktarımı**: Hesaplamanın ara sonuçları, kümülatif olarak fonksiyon parametreleri içinde taşınır.

3. **Sonlandırma Koşulu (Base Case)**: Her özyinelemeli fonksiyonda olduğu gibi, sonlandırma koşulu açıkça belirtilmelidir.

## 🌐 Dil Desteği

TCO desteği programlama dillerine göre değişir:

| Dil | TCO Desteği |
|-----|-------------|
| Elixir/Erlang | Tam destek |
| Ruby | Sınırlı (2.0+ `RubyVM::InstructionSequence.compile_option`) |

## 🔄 TCO Örnekleri

### 1️⃣ Fibonacci Dizisi (TCO ile)

```elixir
def fibonacci(n, a \\ 0, b \\ 1)
def fibonacci(0, a, _b), do: a
def fibonacci(n, a, b), do: fibonacci(n - 1, b, a + b)
```

### 2️⃣ Liste İşleme

```elixir
def sum_list([], acc), do: acc
def sum_list([head | tail], acc), do: sum_list(tail, acc + head)
```

### 3️⃣ Linked List Dönüşümü

```elixir
def process_list(nil, result), do: Enum.reverse(result)
def process_list(%{val: val, next: next}, result) do
  process_list(next, [val | result])
end
```

## 🚨 TCO'nun Sınırlamaları

1. **Debugging Zorluğu**: TCO ile stack trace daha az bilgi içerir, hata ayıklamayı zorlaştırabilir.
2. **Dil Desteği**: Birçok yaygın dil TCO'yu tam olarak desteklemez.
3. **İmplicit TCO**: Bazı durumlarda, derleyici/yorumlayıcı TCO'yu otomatik uygulayabilir veya engelleyebilir.

## 🎓 İleri Seviye Örnekler

### Karmaşık Veri Yapıları

```elixir
def traverse_tree(nil, acc), do: acc
def traverse_tree(node, acc) do
  acc = [node.value | acc]
  acc = traverse_tree(node.left, acc)
  traverse_tree(node.right, acc)
end
```

### Backtracking Optimizasyonu

```elixir
def find_path(graph, start, finish, visited \\ []) do
  cond do
    start == finish ->
      [finish]
    true ->
      find_best_path(Graph.neighbors(graph, start), graph, finish, [start | visited], nil)
  end
end

defp find_best_path([], _graph, _finish, _visited, best_path), do: best_path
defp find_best_path([neighbor | rest], graph, finish, visited, best_path) do
  if Enum.member?(visited, neighbor) do
    find_best_path(rest, graph, finish, visited, best_path)
  else
    path = find_path(graph, neighbor, finish, visited)
    
    new_best_path = cond do
      path && (best_path == nil || length(path) < length(best_path)) ->
        [List.first(visited) | path]
      true ->
        best_path
    end
    
    find_best_path(rest, graph, finish, visited, new_best_path)
  end
end
```

---

## 📚 Özet

Tail Call Optimization, özyinelemeli algoritmaların bellek verimli bir şekilde çalışmasını sağlayan güçlü bir tekniktir. Doğru uygulandığında, döngüsel yaklaşımların okunabilirliği ile özyinelemenin zarafetini birleştirir. Ancak, tekniğin sınırlamaları ve dil desteği göz önünde bulundurulmalıdır.