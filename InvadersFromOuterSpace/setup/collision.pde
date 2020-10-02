boolean hitCollision (float bulletX, float bulletY, float bulletSize, float collX, float collY, float collSize)
{
	float maxDistance = bulletSize + collSize;

	if (abs(bulletX - collX) > maxDistance || abs(bulletY - collY) > maxDistance) {
		return false;
	}
	else if (dist(bulletX, bulletY, collX, collY) > maxDistance) {
		return false;
	}
	else {
		return true;
	}
}