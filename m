Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE10283FE6
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 09:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777715150; cv=none; b=Gv3okZ5EzlKAZ+hwn7sFtLtnbT1YdZDrrvMR3HASkGfPdZ+LpKPkV5JkKQE/C9m48XsBDPSS6COEe+i+LRvYRY55QfIKaimvlMVyAfRm47r7+5IpjGNYfW3tSiGJ2wKPn9JDyp7N/ia+59MAwnschXDDYJVNxxGz1HHGh2gD5M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777715150; c=relaxed/simple;
	bh=A0O+AfYaXnVq6zwFu3qgCAKBc2o2KXAtW4ng6GO/oBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=THX8yM709Z0vFBv++S1MTVz7lYfmv50QQmkBeXV+7emQH76HA4H99J6i50m3ocQSGmGK7Dz3iXReohquw7+rrVqzrHTxr1VmDOWN5t2/zlnUq4bKWf+L8C26RvWnq+Csxr0/W+6pEGBxSzVjvcgcubPRgwZT3WJeu4n1GWlzsmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=sgCwebwS; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="sgCwebwS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777715134; x=1778319934;
	i=markus.stockhausen@gmx.de;
	bh=A0O+AfYaXnVq6zwFu3qgCAKBc2o2KXAtW4ng6GO/oBk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sgCwebwSa5yOdqdhY/Kb5ufeuUUdxb+72QvQ+LFt59JuV1oLZfj49TrtVOSSYaro
	 hio0+/jOgLXFC5Lpebvf4XhaS9Q8bFeBrNIKKKsZfMYhQTuakpNKTY5cbrP0SWeDF
	 cuV7fGxFVnV/NYb2DnvC/MI+gaw4b/6J+o+OhZn2zKc9lP1sSzNpnZCFx3vFkEFm1
	 VKhwOB3gmw9QW8+370aA0vBlFe3WOd4AjZtLC2D3fKWX/lVFv5EFjhER5AZEYtmx0
	 HUxrh+sSGpmBs11aWHk/5TqZtsL71U9h8/aTosl8t84kusYGqf71lA0z3PWBJ5xUB
	 GpnVkKmyWVDCuG+vFQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8hVB-1wES4t0icj-00BmC0; Sat, 02
 May 2026 11:45:34 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	wsa+renesas@sang-engineering.com,
	alkuor@gmail.com
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH 0/2] hwmon: (lm75) Fix AS6200 setup and alarm handling
Date: Sat,  2 May 2026 11:45:22 +0200
Message-ID: <20260502094524.3358193-1-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:erbKUNNKQm3wsPvoIq+uyQtEVFv76waMNGxA47toaYlSpbRXmio
 5xlTR2q2yKMnW3YW+2dCntfVptKTrWKD/C/dW9K+ZbYCVozy4/wi25uj4LK4mh1QW9+Tiw2
 ZvnSMcB/VosXiFudZGWCdf1M7MZfd3WL/WANOzzMn/cMy1aKAm/Q9cMmKW2uGYOJdpuAsMJ
 P3CKHxRY0X1T7TEqUfUTA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/J4zd00xNxk=;O647MMECQMz3RWdA1w24YtwC6Yh
 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

This series fixes two issues in the LM75 driver.=20

1. The AMS AS6200 is not initialized as documented in the device-add-commi=
t.
2. The lm75_write_config() skips bits during initialization.

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>

