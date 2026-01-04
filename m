Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFF3163;
	Sun,  4 Jan 2026 00:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767485228; cv=none; b=ksvpir4XKRAi0gWBNMKeSSl9xWncUyYedqv6syjUNUqUUQlZYkZ/Dc4wSu8NfZIWAeRPcKXB3kmXpOS4/GxXKDUYuvzWikOL3WK9ni560GAf/dtkhvDB+/juxkrjDm4itLKYLAiCQ3O6117pTizSFZRgUvwgHgpYt9kNK8wY8cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767485228; c=relaxed/simple;
	bh=Xj2RxILGaVDgIiiYbuFvqe3xEIynUCuSPXDtBRdv+So=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=svKRcsN6QSSveHFQ+qyjvz1YwoK1OvY7ktIGSlbJ28M2AwajWm4oxGcjgZp0QHxKJbH4phMRv763scICGkqe2VhpS7ZYWS7hKDGG4FBARTr9ctHYuHZYkPwAEoMvNscq47ng1l1TjSv/kzKPv5LBhWllGsn1Db8ZU3al165TCZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=EMY8Z3ov; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="EMY8Z3ov"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1767485222; x=1768090022; i=w_armin@gmx.de;
	bh=4zON+nFHjzdiTPNLRt4qIASoaKWQlU8HhQnC6Wc+zVE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=EMY8Z3ovuVTZq/Z0tnu0yWOdgKpvLQLxNXUYNzyBc3d1vXtuFOuK+UgIxsj6AvWW
	 WMIGXI+U1/ketm2McJ/Rpr4NaV1pN6iWDtZLbVo3Om1mLEDYZUrXn7RA7o5pA8YwR
	 BhygnntoY31+y2+VeYnjlo//pYo2+oGTFYk2vI/GChjRoFoVH5JZJCfJ3el/zS7Dq
	 YStsGUtOzlMGID9tRObZJ7u+YjotmiGeB4Y0MG/zvuUbwX9q22tsNw67/4Lul6fxh
	 kR/Zbvu03Nq/eJH4O3UVHbmsvD8Ibi7sv9t/1YJLMZ38fjBHrX8+7Qzx92iACYcVr
	 N0Xa7YbTfIPZ08KvWg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from linux.fritz.box ([93.202.247.91]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQe9s-1vHuyW09HK-00LsQ9; Sun, 04
 Jan 2026 01:07:02 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: pali@kernel.org
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (dell-smm) Add support for Dell OptiPlex 7080
Date: Sun,  4 Jan 2026 01:06:10 +0100
Message-ID: <20260104000654.6406-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:l1Nh0PktD+pTddm3XKhqVfgU2kLW2RbCAqGbgB9vE3R4kUiZp2k
 A5Hl/KRnIgDOd/UEVgQ3ezhhhg7jyLukiYaUOrHwFvwoAcQBM5uuOKB3huWiNhntkS26vp1
 MXosD5k95Jiu3nr26Cz+BqM09N6hsZ+z1oaw9ySU6IkqOkXvJ4pY0obkQWYflL3KCxtZS1c
 HY5dUZZqqxBsLEXMwkVkw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Esq0MmNfW+U=;b8msz7ZaN05K5cIKb8631PYDtWc
 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

The Dell OptiPlex 7080 supports the legacy SMM interface for reading
sensors and performing fan control. Whitelist this machine so that
this driver loads automatically.

Closes: https://github.com/Wer-Wolf/i8kutils/issues/16
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index a34753fc2973..b9941e8d2c2d 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1316,6 +1316,13 @@ static const struct dmi_system_id i8k_dmi_table[] _=
_initconst =3D {
 			DMI_MATCH(DMI_PRODUCT_NAME, "MP061"),
 		},
 	},
+	{
+		.ident =3D "Dell OptiPlex 7080",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "OptiPlex 7080"),
+		},
+	},
 	{
 		.ident =3D "Dell OptiPlex 7060",
 		.matches =3D {
=2D-=20
2.52.0

