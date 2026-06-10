Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D720B48C3F8;
	Wed, 10 Jun 2026 20:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123746; cv=none; b=E1P6UMRbdVh791lU6FJGXofDjtftnc9Bf1gdXcND/tLp575PBs6CKeBo9ct1Jseh0TIb7iOPatffRcc5BIttXIED3V51GCeA/gXw8UEOKq99b8nX5azM3Q320SfGkn2rKDs6LCI9oB6C2bXbMo5+IRr9Qitt6E1M8KwvTEergdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123746; c=relaxed/simple;
	bh=gnkQm+P8HS/I/ewWBcTErhvRyavdmzX4Vx5xmBZykpA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jZ0XsRf7Za15A/mhoISM14GzSIuHtLNlnCLTEip4OBZJrjQPq/DgK7C8paZU+668/fpze6qYLkV8bhn2mIsdTIESRH4G8Jd2syE0Pke5hWxjIIPzvwbZ+vbVup5g/arF4kiKkslZhKowyplGWMFc6LLTEE6d5XOG8tYjNuBTlQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=cEAWlN1j; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="cEAWlN1j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781123720; x=1781728520; i=w_armin@gmx.de;
	bh=/Wu/SGJTFJsZ86bic/V+We8bgTC0/Fz5FZwe+gXPcxk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=cEAWlN1jlFR/AMDU9pwccwlfs9+jAm5vN5SP/L9OS6xkMneVyyiSLzN/PpRNwkKJ
	 nvYrGFPFRdEJ9X/NEA/ogJGEEeHj4SnkjTgDkrAmTZ6ltNWZd+POkdC6AMo4Ezac6
	 t0XIhVUbwq6vSP0CBECK/j/50i8Oxx9Ie51ylsMuQKGDvOOYpsWCGYNaZ7LA7A+to
	 FqGF9mkx98KvqP9G2warQ5DKyGIWU2bzGfGIc/lZPY/Xt720mmw6+5SDFDWJr2uwE
	 m131chNNpEjBqc7zmPQC+ktfZc+CwxFFENMa1w9ewucgwh2PpOVp7HMNVcfjCsKeP
	 Y+7Ptgbo1ZmT8qLBwQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRmjq-1weW8z1PCc-00HkdW; Wed, 10
 Jun 2026 22:35:19 +0200
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
Subject: [PATCH v6 7/9] platform/wmi: Make wmi_bus_class const
Date: Wed, 10 Jun 2026 22:34:51 +0200
Message-Id: <20260610203453.816254-8-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260610203453.816254-1-W_Armin@gmx.de>
References: <20260610203453.816254-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2ZN1vvPXPjfgCZnGbtURP/EQnzINSoRQg0h0QBrfb8rOIuaaUaz
 WGggKnW5EQaED2kQOWKYK9cqUzOrm1UfPyPhx/vByEv5w57DB2EB0mGM8OzuHl0lZueJnPn
 e6A9f487BHfEp9HH+6iR0SBsl1yOQgYCy5vjpdH60LI0IHDN0etpjPOcCbckhYTz2VW/DtM
 fgIPsBAWMZs1ozmk9onfw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wBkd3WCw2oA=;kQbotIqHY5QJYCT8eNyKrQSCZ8Y
 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

The functions class_register()/_unregister() and device_create()
both support taking a const pointer to the class struct. Use this
to mark wmi_bus_class as const so that it can be placed into
read-only memory for better security.

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
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

