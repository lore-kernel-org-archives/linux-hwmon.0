Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FB5DF5C
	for <linux-hwmon@vger.kernel.org>; Sat, 20 Apr 2024 17:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713634474; cv=none; b=A7MdQX+kXiNcRLMajf6iLotF9ZYiju3WaziQhR2ACLzAQ8OdOffhmpm3jI7rmDyVzTWR146rt6QKv1kGiiT8+XztEMqlJD6UZtg6LiD/Y351dRWKQcW03Oo7pbQL4ZgE2zHxo0I/7bKRN8b8qcNB0G5IiRE2mnDhuHGMCezInDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713634474; c=relaxed/simple;
	bh=sgJpD6pT5euqsPS0ky2935TMJXw37YwQ8brJWgmAqR8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=RTNP4RqSlu5brw3XWE7VlVaSltkmfNfElC0LDR6ZRbvKHys2t1UmGuWgTtW9b/mr7cROUSTP4vgJG9A+qnTzL5GkR3AkAu22kmHqCVTkVVsilDHJ02v+f0R5v8BVlnKmVmIa+YnqOunxmJTjZ2I33kvG23xwyM3/X+5i6Fx1cJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (1024-bit key) header.d=wp.pl header.i=@wp.pl header.b=OgmS0ksX; arc=none smtp.client-ip=212.77.101.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wp.pl header.i=@wp.pl header.b="OgmS0ksX"
Received: (wp-smtpd smtp.wp.pl 40955 invoked from network); 20 Apr 2024 18:34:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1713630868; bh=s3/S2Lh+VeVaEVAYzO7EeaMpOud3W4I3j0yUVGXi/VI=;
          h=From:To:Subject;
          b=OgmS0ksXh5nc4VXM4U0owvoiP74PnoW5zDlfgXCCgF6lCbnz1qU0Ixw2JFlkUFLwZ
           kKTmrA4LQN5tadgZlEzktXpCAel9i+YVTgPbg+i5QOphFmC9Lo3mp//MTMfLviWYkA
           ip2gZWnNw10PBLG1+l3JgoGVl1uIEdVNTbSvhVeA=
Received: from public-gprs181069.centertel.pl (HELO mocarz) (deweloper@wp.pl@[46.134.46.142])
          (envelope-sender <deweloper@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <linux-hwmon@vger.kernel.org>; 20 Apr 2024 18:34:28 +0200
Date: Sat, 20 Apr 2024 18:34:27 +0200
From: Aleksander Mazur <deweloper@wp.pl>
To: linux-hwmon@vger.kernel.org
Subject: Regression in lm90 driver regarding GMT g781
Message-ID: <20240420183427.0d3fda27@mocarz>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-WP-MailID: 27f9bef06a17bde7b44aae34760a84dd
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [QVOk]                               

Hello,

I have a Wyse C00X thin client which is apparently equipped with GMT g781.
It is (or used to be) supported by lm90 driver. (I have a log from 2020 where
it was simply working fine; it was kernel version 5.6.0 then.)
Now, with 6.8.7, I get following error:

> lm90 0-004c: Failed to enable regulator: -ENODEV

However, when I just turned this message into a warning and let the driver
continue, it seems to work fine, providing temp1 and temp2 as previously.

Do you have an idea what could cause such a regression, and if this change (I
mean: simply not returning error from devm_regulator_get_enable) is safe?

-- 
Aleksander Mazur
