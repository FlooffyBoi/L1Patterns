require_relative "methodsv3.rb"
methods = {
  "max_prime_factor" => :max_prime_factor,
  "non_five_product" => :non_five_product,
  "gdc_odd_composite product" => :gdc_odd_composite_product
}
if(ARGV.size<1)
  puts("Warning: function name required: \n")
  methods.each do |k,v|
    puts("#{k};")
  end
end
if(ARGV.size<2)
  puts("Warning: number source required: ")
  puts("<method> file <filename>")
  puts("<method> terminal")
end

select_func = method(methods[ARGV[0]])

if(ARGV[1] == "file")
  if(ARGV.size<3)
    puts("Warning: file name required: \n <method name> file <filename>")
  end
  file = File.open(ARGV[2],'r')
  text = file.read().chomp()
  file.close()
  num = text.to_i()
  puts(select_func.call(num))
end

if(ARGV[1] == "terminal")
  puts(ARGV[0]+'\n'+ARGV[1])
  input = STDIN.gets
  num = input.to_i
  puts(select_func.call(num))
end
