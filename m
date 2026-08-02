Received: from sender-of-o59.zoho.eu (sender-of-o59.zoho.eu [136.143.169.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815081DFDA1;
	Sun,  2 Aug 2026 13:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785678203; cv=pass; b=GPi9AU/aNlxpIyX2DtgjZR8jPxi9ljxQcYJma1EB/toVeSDRtFoTFeOypU2OHvzQyuVfLtgUqfTWsw1C1p1bdQN1QUG+RJH893wWd0dcljmpRhpS5mU5PoYyvLdC7ajDieIvhck74O8PNHnG+9/6PgEMV/eebcsddKWbg1Ya6pI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785678203; c=relaxed/simple;
	bh=rQcyuogemQ3lJwYIpaG9/sSMedMlItEMifdrHAw4ia0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pK97nmPAinqCDXjdCVzwYGXncGT835EoczBksenivbY5ULEUJ47Yg3rZK3CUGG10ZVA979FHg9sQ7SBwmBZ9wMBZcA4RMQqg7Sw2mC6m/pqhrs6iq8l2fRrWL6E0ZrBJOvErTtEqWyRa9gLrAu0FAZNqSWhCKy1RLI+pp6raVds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com; spf=pass smtp.mailfrom=iusegentoo.com; dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b=rVyXJCPy; arc=pass smtp.client-ip=136.143.169.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b="rVyXJCPy"
ARC-Seal: i=1; a=rsa-sha256; t=1785678176; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=T75wPa4Jc1QVMuNQPNuipGOwjA7T64F48etXsUk8/njGAaYtO3DiqwOWie3Vvvb8AA80zeTtRHnFNXNWwKzqVUeWkQq24L+fDm1SrfHgbxuyIMjRw9yapl/Qy59YDk66jDagEFJODxjPt5RQnfQJg+40El+hpURgkOsnph799ZY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1785678176; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+I7F3wouIWvTutXp7nbVX0VXKfFJ1jCKlb0ZfoLK+YE=; 
	b=inWQ9Ak+zMyeMzXjkyrX7FptAbsQ4ex+1hH+FeU+jIAfAZusCfGPfwstK/IPNHsR/A7WzWi3TP3aQFhF1/+Nu7zDAQDJ5u/+0f/ePo6yuY+vEex2+Wkea+M7pkLx4yj/D+nIMeCCRsu5KoUzMxz1HmwOWqNIb+TLPNVMhpvDU0Y=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iusegentoo.com;
	spf=pass  smtp.mailfrom=ali@iusegentoo.com;
	dmarc=pass header.from=<ali@iusegentoo.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785678176;
	s=zmail; d=iusegentoo.com; i=ali@iusegentoo.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+I7F3wouIWvTutXp7nbVX0VXKfFJ1jCKlb0ZfoLK+YE=;
	b=rVyXJCPyLLGM0goZUefRd0QPZ+B0xsTqaT1cq+z8M/le5qJdYoFqm7rWxeM783eh
	JDZ5sbi4vzz+7wY/UVI3O8N61nsgC2MnxRT5bD3Bsa+XWPiI+46ThsgqvDC+XBG84Ib
	Js03evXn75gd7PQ7WsAhxhaJnH/lloN+7bAnUNXA=
Received: by mx.zoho.eu with SMTPS id 1785678174475696.3774572050104;
	Sun, 2 Aug 2026 15:42:54 +0200 (CEST)
From: Ali Ahmet Memis <ali@iusegentoo.com>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (corsair-psu) null terminate the vendor and product strings
Date: Sun,  2 Aug 2026 13:42:44 +0000
Message-ID: <20260802134244.29107-1-ali@iusegentoo.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260802150354.04fd3857@posteo.net>
References: 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On Sun, Aug 02 2026, Wilken Gottwalt wrote:

> The device always provides terminated strings. The vendor string ("CORSAIR"
> or "Corsair") and the device string (3/4 numbers + 3 letters) are allways
> around 10-16 bytes.

Thanks, that settles it. So there is no reachable bug here, only a driver
that relies on the device terminating the string. That changes what the
patch should look like: v2 will say that outright, and I will drop the
Fixes: tag, since this is hardening rather than a fix and it has no
business going to stable.

> Actually, it would make more sense to change the memcpy to
> "REPLY_SIZE - 1". Just my thought.

That works. One detail worth weighing before you pick: corsairpsu_usb_cmd()
is also reached with a non NULL data from corsairpsu_request(), and
corsairpsu_get_value() passes an uninitialized u8 data[REPLY_SIZE] on the
stack. With REPLY_SIZE - 1 the last byte of that buffer is never written.
Only data[0..3] are read, so nothing breaks, but the shortening is not
confined to the two string callers.

Either is fine by me and it is your driver, so say which you prefer and I
will send v2 that way:

  a) memcpy(data, priv->cmd_buffer + 2, REPLY_SIZE - 1), arrays unchanged
  b) vendor and product as char[REPLY_SIZE + 1], memcpy unchanged

No rush on the locking patch either, whenever you get to testing it.

--
Ali
