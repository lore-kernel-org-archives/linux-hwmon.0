Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1BA217F27;
	Sun,  8 Mar 2026 00:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772929543; cv=none; b=fEShmTv6kSysBQDA2+RgKqDfsn/kwabypBJPARItf/UcDug2QZlMoi3WiXaoomK6JlHQ1YztjQDHA5NX9HvgF2k4DK3Mktk16LpaNV+tef5oycFu1Ha1ocJSfSUl3PfEuGN3R5dmP5uCI+kizZMFzLeEgvhGUKDvTtDbE2lf5gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772929543; c=relaxed/simple;
	bh=XkCMJ7ozZ5TIFut03c48XQ8wVAkXKSmOEqRVO85lZyc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sEeaWIKl1ZOlo5csR31XDKr9xhm5bKE37YnH6MFXzHPdMhmgQewMpVkEltSkN7rAm71PsVRvcNuoHV6fmrhz6Fd1CVq1jz/skP/X2RKE80beo2rLCa33fi7BZVrGXa6ygaswpQm5Y9Vk14QbK5cbfPHl9/LrJPOzUVfoCOLCSr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=T0t2q6Ed; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="T0t2q6Ed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772929536; x=1773534336; i=w_armin@gmx.de;
	bh=U70qC46D3P6sJ9E78bZU/zkNQ2aG3Rvvw/Di3Z3vUrQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=T0t2q6EdW2MCivPzFi2YZ5ZE5VTVq7ytyv+ZWi4drTPL259Mn8ZtQ6X7C0Dx8xjL
	 tgtqE1TLmd/YyRP3yWPKB0fjx6recpl8/0HlAQA3zSM7QEu46I5GHliW4WHuEoULk
	 jo7wuflTu9cwVT/GGdtPlrpC1f9L/3UUN9C4GFcGHgf5aZ0CDct8O+g3dSyGr8osh
	 CmcZtAHKY8o8mdGZA8vXY7hnVrRZcbTqV+/+L7udivKVzmuxfk8Gz3o+5OhJx4aO9
	 rpKqjlT2xfTR/9BSOtA2hHE5Ny+C/8bRmPvgxiFEWhR8gmHJcuIwH75jRq6xPWZeB
	 hFy9mAodqhcRux5Hjw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4hzj-1vYBp12VQl-00wHMA; Sun, 08
 Mar 2026 01:25:36 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: Dell.Client.Kernel@dell.com,
	pali@kernel.org,
	mjg59@srcf.ucam.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Subject: [PATCH 7/9] platform/wmi: Make wmi_bus_class const
Date: Sun,  8 Mar 2026 01:25:20 +0100
Message-Id: <20260308002522.4185-8-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260308002522.4185-1-W_Armin@gmx.de>
References: <20260308002522.4185-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kFkDScghcW/iOcmbYksqcJojfCyt0GFot5Chwu45O7cVvZMTFux
 Bfty3fqTJ25xE7Y+RPE3qB9/HQJ8mXeVZYjf0jP2Fagu+2aZyzHTivziMt2SP330GI42+Ud
 641kRcWsCXdVEyN+NxtZIYcUfAZF6dsZW1YYnwjr6Inxs0pKOSa/xbDIE8P0AE6VZJ1B/zy
 JNsprgWNUzyTZFV2hM0hA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Az72nDoYo1c=;sYuzkXWMTJZcOGIHG3lEJncwzlf
 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
 x5hqu60eqtjOXsAKcCaAuBHmvjqvKqaXhyOVNM

The functions class_register()/_unregister() and device_create()
both support taking a const pointer to the class struct. Use this
to mark wmi_bus_class as const so that it can be placed into
read-only memory for better security.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/wmi/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
index b8e6b9a421c6..082c85625878 100644
=2D-- a/drivers/platform/wmi/core.c
+++ b/drivers/platform/wmi/core.c
@@ -1069,7 +1069,7 @@ static void wmi_dev_shutdown(struct device *dev)
 	}
 }
=20
-static struct class wmi_bus_class =3D {
+static const struct class wmi_bus_class =3D {
 	.name =3D "wmi_bus",
 };
=20
=2D-=20
2.39.5

