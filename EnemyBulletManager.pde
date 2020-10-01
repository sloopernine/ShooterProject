class EnemyBulletManager
{
	//Ansvarig: Johan B
	Bullet[] bullets;
	Player player;

	EnemyBulletManager()
	{
		setup();
	}

	void setup()
	{
 	   bullets = new Bullet[10];
	}

	void spawnBullet(int x, int y)
	{
		for (int i = 0; i < bullets.length; ++i) 
      	{
        	if (bullets[i] == null) 
        	{
          	bullets[i] = new Bullet(x, y);
          	bullets[i].velocity = new PVector(0, 1);
          	//we are done, break/quit the loop.
          	break;
       		}
		}

	}

	void draw() 
	{
  	//Update bullets
  		for (int i = 0; i < bullets.length; i++) 
  		{
    		if (bullets[i] == null) 
    		{
      		//No bullet, skip to the next one.
      		continue;
    		}
    		else
    		{
    	  //found a bullet, update it.
       	  	bullets[i].update();
    	  	bullets[i].draw();
    		}
    	}
		
		for (int i = 0; i < bullets.length; ++i) 
		{
			if(bullets[i] == null)
			{
				continue;
			}
			else
			{
				if (bullets[i].position.y < 0 || bullets[i].position.y > height)
				{
					bullets[i] = null;
				}
			}
		}
  	}
}