Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2B23290C3;
	Sun,  8 Mar 2026 20:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773000176; cv=none; b=CCMPL7WrIfOX4g+SZoLoehx56nrnqrn1jLCNViR9Pm+5sqYGe19okrFfmKW5u1yzzbyWmqQS+qsJdUQLWq7iIVzj7BtkvzHId4bKdXlsTpwnVd03udFwm9/E+bIPoJ8fc8pQtM4ynKnfnyLcLlXPjZngFEsnizWNFtE6Jveh9GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773000176; c=relaxed/simple;
	bh=XkCMJ7ozZ5TIFut03c48XQ8wVAkXKSmOEqRVO85lZyc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cXixH9QW5GFuBEMQ40UdF8oeBweHex4mcOR/JtwWljRiYaM8QKIWwqTCvAkKJKw/WH3AikaDiXMgPRwQA0T9ywaHmx0fkfcN7OO1G0n20luVf13xo97hq2YwWIdIQO4cyr5uUjSLdQJLNPu8w8yvDWSPWNIgSoA3usqO2DvCAEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=oak/foso; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="oak/foso"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773000159; x=1773604959; i=w_armin@gmx.de;
	bh=U70qC46D3P6sJ9E78bZU/zkNQ2aG3Rvvw/Di3Z3vUrQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=oak/fosoGxf0htf5/ZAfaXbkgCUtQ10CRFpjeiSATXJ0BjHASdG2lmb0ZhG6b9hP
	 dISlgG8MKnYht/DBxfKlHyZlDTNXOD4q4ArEeU4XCtI33n/XN5wKPg4bOyq8DsikP
	 EXUxPvgBgfGIUezRt5uKiqmclM2MDPg6NiXnGaMaF/o+Z1FtNOVMy0V9ZLThU9OOI
	 HjAqrNaywCJUeuy0xLotSQTbyekB4L6O41jUZoodt1SAKok+QLqiEwa9+BQDUuHie
	 v3M7K493uQKIbVZnOTOThHzixQjY9ZL1FmmBo6J+CQZsNCTf+u3ixt+vGPun84QCz
	 L5QJxg3ELVaAp1IdJA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MiaY9-1vTXsf48pz-00p3nj; Sun, 08
 Mar 2026 21:02:39 +0100
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
Subject: [PATCH v2 7/9] platform/wmi: Make wmi_bus_class const
Date: Sun,  8 Mar 2026 21:01:53 +0100
Message-Id: <20260308200155.118950-8-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260308200155.118950-1-W_Armin@gmx.de>
References: <20260308200155.118950-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+3L7ONRf3gwAY7aiZEn8ICsNB6I3mRGfKWc6UrH4ra1oKLPXWzL
 r0vBqUdwzQ9vAI3jSpPLzKmni5cEevadLrfPirRz00grAWu4KkBIe/AiyAF9F6iRO/AAswX
 wN2TFBQEP3kNjn3Z82mWLz2WNp2rbaa9xDJeqXD3qxprX1t9Yvxld1mBD6zd5HgUIFQ8Hwv
 Ci7TwS1LTk2rPLR86v3FA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XpiX+rQo+Jg=;R9ulrWKfuvNPTqpavr820tFewp3
 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
 0zX0Rszk=

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

