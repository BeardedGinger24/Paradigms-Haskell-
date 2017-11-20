
public abstract class Duck {
	
	protected FlyBehavior flyBehavior;
	protected QuackBehavior quackBehavior;
	
	public Duck() {}
	
	public abstract void display();
	
	public void performFly() {
		
	}
	
	public void performQuack() {
		
	}
	
	public void swim() {
		System.out.println("All ducks float, even decoys!");
	}

	public QuackBehavior getQuackBehavior() {
		return quackBehavior;
	}

	public void setQuackBehavior(QuackBehavior quackBehavior) {
		this.quackBehavior = quackBehavior;
	}

	
}
