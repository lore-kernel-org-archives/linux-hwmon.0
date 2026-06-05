Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DC233F586;
	Fri,  5 Jun 2026 21:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780693203; cv=none; b=kSijwnKhEwhQMubPgJc/gsPu5osLEZ6xODYYU79MrzM4mZMz+3jNLBYM42/8jBFB3NMrOC/P1DaNpKHjpDcLay5LDPGUcJiX/IbumfUBoRKAL4WK1hYNTu+9WgzT9ZWBmMlru8N88cxWfghyRRRNwyrNbT9ztsaDLWIzcpCuRxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780693203; c=relaxed/simple;
	bh=nLtcvkhpSXkEvlXiy2pD63CXTukW1mVtLyB3M5nFgUw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bsmnBqDSRK5Z8xsb+qC/Dbq224Y/O+UdxJSuf/3UKlXa9INOJCJFSnmDdbkJEDLRrxy5pFqOGx5JC/x3KY8Y2h/N+pmgzvcX3laUmu+HXz2LzAv0zoBsWNQWy2u8Df/bliQ1lx7EKK2MNJ9o8hiupk7ZdqnwXTJ3mt0v1Jxc1Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=cfORgQJG; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="cfORgQJG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780693191; x=1781297991; i=w_armin@gmx.de;
	bh=fdOoZ8WmHvqJCglSFIUvvsAHkg44uZt705ch+vDqRiM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=cfORgQJGi32QOo99kZYqoJgRVWOVuzMM/FX9itmZTWVanmdHK5WKoYowVwQtnLLx
	 ETTZFsXB6cLVlxc+sNoIhH7mrOdVwj+QpKMK8u14E7HVvpMYlFmRTlDu1UinVaeE3
	 Vf11RcJkozJhZJXSW3J6yZvL3AbHSrw7usHuuXbBxML3CJ/reiBHU2aZNUuRvSxUy
	 dFHqTjc5nanX9AbWDawF7zXbn4Jb5p8QbK9ZPE7a/cc8VwYzfVW1A2xV68HqP2Lk3
	 p59E/z3h/w2aF0bWt82w39KKKbSVnv8vI3JoJBR8lR9dhxc6E5AQMuOOHlcAv9kyU
	 QkyLxD7UyTAbczWg4A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MC30Z-1wPnIJ2r9x-00ECWA; Fri, 05
 Jun 2026 22:59:50 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: Dell.Client.Kernel@dell.com,
	pali@kernel.org,
	mjg59@srcf.ucam.org
Cc: soyer@irl.hu,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	mario.limonciello@amd.com
Subject: [PATCH v5 7/9] platform/wmi: Make wmi_bus_class const
Date: Fri,  5 Jun 2026 22:59:35 +0200
Message-Id: <20260605205937.530897-8-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260605205937.530897-1-W_Armin@gmx.de>
References: <20260605205937.530897-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:y0xj0cZsp4fsHY22Hq6JgePJw7bg5YTgFLIyqtMPzc17C1UnCeh
 QW8MC8AN2RoaQp/+YTxZObTiNjitJxRTagriF/EBTGm/T2kqZ83ObWpvRQXjmmQwltHVsHR
 ZgWvo9fEXCkkAcSsNa97oGjn1R1LJFwwRC0vUErj61+EM6ar1cWUJy24Z5GVAalAna8dmXw
 6vkCuPF/PLeTvQo20f9fw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/nkRZH9/WHI=;/h++0cm8wFdxxqAcJ+sRFJ1a+yp
 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

The functions class_register()/_unregister() and device_create()
both support taking a const pointer to the class struct. Use this
to mark wmi_bus_class as const so that it can be placed into
read-only memory for better security.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/wmi/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
index 5a2ffcbab6af..0782ebc33c00 100644
=2D-- a/drivers/platform/wmi/core.c
+++ b/drivers/platform/wmi/core.c
@@ -1088,7 +1088,7 @@ static void wmi_dev_shutdown(struct device *dev)
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

