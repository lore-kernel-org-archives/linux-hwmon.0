Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122EC33ADB1;
	Fri,  5 Jun 2026 18:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683312; cv=none; b=hW1p/gspVZkNlOdV/HZSHsqBVIaOkkgOU7V7CsKCIhq5XHL7sw9ykhfT9waIzO23r+Jqhy8fICRXzLpAK4DpC6pU3iu3ylRJXU5al6qBE6f3nf8gz1MI3bBJUV6q31eQDOR+R2FKpJJKZggY7GMkwEWqpXRGRFdIIiVLcyB5U0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683312; c=relaxed/simple;
	bh=nLtcvkhpSXkEvlXiy2pD63CXTukW1mVtLyB3M5nFgUw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Us79Tweivxd25DNvdq54Mg8duqAHfE5KDqlml+6BqtQUS4mQSZznCoPHW/KB/wehZphQ8BbgKSbQi4pUbhEbRDPF4AvdjjIgquBLeLaUFo3Q5Ha/KduxKG1JRvyf8uIOeO3kbp+PdtFnSwt1Q5jOC/m1SSqdT4ao34wXyCjmpz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=TyATYreW; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="TyATYreW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780683285; x=1781288085; i=w_armin@gmx.de;
	bh=fdOoZ8WmHvqJCglSFIUvvsAHkg44uZt705ch+vDqRiM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=TyATYreWGZsKm/BIPXOCoeXb3YMiwKiCYivr0ODPAPEwvdWeV+/CI10XFi5y+4LR
	 QUeH7SzdR6lQFy/ZwDc+hMVoe26M9Kl1e8cy9bRBV4vsvIOIXJJERaGHkpxgY8Smf
	 OPGQqAKq45/OfeLiCyx0VoN2VrfgwxiXHqJJPJkaGDjnLhLytxPIqi1KxhDsHJALP
	 z/7WF2x+PmcQtL6VtKZKd4HBQTNi9xbTomC3062/0UgQXjBg0lFAf4AAidDWUIFPx
	 bOmHyKBLpWNp9pTjMY+quX72lZBuQsiZY/sapNilYHgSTIhmETgBVbxDhLrP2JaCZ
	 qjbo8xYRY6YEYG4G3w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MirjY-1xAO3d0JYC-00k1CL; Fri, 05
 Jun 2026 20:14:45 +0200
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
Subject: [PATCH v4 7/9] platform/wmi: Make wmi_bus_class const
Date: Fri,  5 Jun 2026 20:14:31 +0200
Message-Id: <20260605181433.188847-8-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260605181433.188847-1-W_Armin@gmx.de>
References: <20260605181433.188847-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VfvgwnmxN4mPeDShLbRzafixJfpqADKGxe7UvumPyoWVLAbWaEU
 iX7zAu7QiXy8I1PpNz8JrIa0Uzrre7Jzq5vqwipA0MQrA1FElaPC86luree3fQx6mFUClp4
 x+agpBVdXeol9imKwpEieFCaPV91KGEq5usucxWQ9VhcFww1JaU8D3C2FkUV9+x4RUT4t+N
 APN8HWy5VVAquYDfZ94VA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vYUJvmqo8c0=;u4HqwTLXhx0e0dblEkhaT/dLOpN
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

