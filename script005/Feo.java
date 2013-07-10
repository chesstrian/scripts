public class Feo {
  public static void main(String[] args) {
    int n = 1, a = 1, aux;
    
    while (n < 1500) {
      a += 1;
      aux = a;
      
      while (aux != 0 && aux % 2 == 0)
        aux %= 2;
      if (aux == 0) {
        n += 1;
        continue;
      }
      
      while (aux != 0 && aux % 3 == 0)
        aux %= 3;
      if (aux == 0) {
        n += 1;
        continue;
      }
      
      while (aux != 0 && aux % 5 == 0)
        aux %= 5;
      if (aux == 0)
        n += 1;
    }
    
    System.out.println("The 1500'th ugly number is " + a + ".");
  }
}
