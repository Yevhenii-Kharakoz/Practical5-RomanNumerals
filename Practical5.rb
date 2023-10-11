
ROMAN_TO_INT = {
  'I' => 1,
  'V' => 5,
  'X' => 10,
  'L' => 50,
  'C' => 100,
  'D' => 500,
  'M' => 1000
}


INT_TO_ROMAN = {
  1 => 'I',
  4 => 'IV',
  5 => 'V',
  9 => 'IX',
  10 => 'X',
  40 => 'XL',
  50 => 'L',
  90 => 'XC',
  100 => 'C',
  400 => 'CD',
  500 => 'D',
  900 => 'CM',
  1000 => 'M'
}

# Функція для перетворення римських цифр в число
def roman_to_integer(s)
  result = 0
  i = 0

  while i < s.length
    if i + 1 < s.length && ROMAN_TO_INT[s[i]] < ROMAN_TO_INT[s[i + 1]]
      result += ROMAN_TO_INT[s[i + 1]] - ROMAN_TO_INT[s[i]]
      i += 2
    else
      result += ROMAN_TO_INT[s[i]]
      i += 1
    end
  end

  result
end

# Функція для перетворення числа в римські цифри
def integer_to_roman(num)
  result = ''
  int_values = INT_TO_ROMAN.keys.sort.reverse

  int_values.each do |value|
    while num >= value
      result += INT_TO_ROMAN[value]
      num -= value
    end
  end

  result
end

# Введення римської цифри або числа
puts "Введіть римську цифру або число (1 <= n < 4000):"
input = gets.chomp

if input =~ /^[IVXLCDM]+$/ # перевірка на римську цифру
  result = roman_to_integer(input)
  puts "Результат перетворення у число: #{result}"
elsif input =~ /^[1-9][0-9]*$/ # перевірка на ціле число
  input = input.to_i
  if input >= 1 && input < 4000
    result = integer_to_roman(input)
    puts "Результат перетворення у римську цифру: #{result}"
  else
    puts "Число не входить у діапазон (1 <= n < 4000)."
  end
else
  puts "Неправильний ввід. Будь ласка, введіть римську цифру або число (1 <= n < 4000)."
end
