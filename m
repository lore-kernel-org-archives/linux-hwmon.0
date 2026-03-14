Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9B33043DE;
	Sat, 14 Mar 2026 17:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773510796; cv=none; b=IKf2xUlqPNai6jAKm51MNjKqmyA34s6C4FWKZsA2xjY73uEtP62YNu18FHV/8zkno9ekriNa5K+bN4JFrRRhstZmTNhi5HpUQaGPl7QEoBSsiG24GivC0QF53WZPHztwHMy0Zs6nr52yzkWEb5CoqHewXzx2ZnzAJaj9s9pIzq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773510796; c=relaxed/simple;
	bh=XkCMJ7ozZ5TIFut03c48XQ8wVAkXKSmOEqRVO85lZyc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fTAT5osgJPtX2vEt8NGfElnWpo4z2LeG2khcmsM8vC85fIOL7RZkELDpIxRQj+0hj47Qv3IN0+3j/stCgOLOiChlgleuoQobFjswiAYEB+l0d68p/D2lR8xfJQsYiDg3uWT5/pM8piOBsB/RN3V5mkvdqLRJZW57qqTZ7Sa2UqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=lfN+Ue/v; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="lfN+Ue/v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773510792; x=1774115592; i=w_armin@gmx.de;
	bh=U70qC46D3P6sJ9E78bZU/zkNQ2aG3Rvvw/Di3Z3vUrQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lfN+Ue/vZww7sF/Pw4wMeyjeCTinqAZCB5SkSy/vFu6D85W66yl5sWqAilKTLMF0
	 luhL2CR32VrhFvHGNubcaWjy0OI6bI2EjL7KDuvl7xy1433LRCEaxYcVn/UrV/BTD
	 yJZAhcnp3581ChquJv7MKpL4QMlILzuM9kyo6Gn6fCnBbahs0CHwldKFC5oMPIuzy
	 OqDPeAqQrUEh0rRffsCqA5VoGWxdSwFAOpTQZI4/ha4vB6Kr1gzhQ+dQDQdFBloMU
	 1Hla/Ehd72WA7ktGGjiNfTJcL14N4125nGUMTyJAbM+uFip9CyertlA7ezrx5UAPq
	 JSQgerzrTUjsC+L9PQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M59GA-1w0NFE1lUC-002031; Sat, 14
 Mar 2026 18:53:12 +0100
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
Subject: [PATCH v3 7/9] platform/wmi: Make wmi_bus_class const
Date: Sat, 14 Mar 2026 18:52:47 +0100
Message-Id: <20260314175249.16040-8-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260314175249.16040-1-W_Armin@gmx.de>
References: <20260314175249.16040-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JZhp8kcfJEa+871GAAGz9p7vxWkk15gRa/FeNioIlzH7TfEEDJv
 dzgtIDsIcjgZqTemsoQK6oT54M9Jxzs9F5FYUMNvoZeZrgSIkV6o4iSkbiAgzLb1P+5f+JY
 ij4ofx5pMd70p4/bj0sCYY62dLxvWmJapNSRbL+bo5op0Q0ktUeH9HEkMYI8cUFuCMCUDrp
 Jvwa6usKOz8H7jZ0tPYBg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HZKP00NpQmM=;arTL0cbueFNhXGVkiWrs/BVq/0v
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

