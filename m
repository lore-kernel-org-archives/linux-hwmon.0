Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D3332ED24;
	Sun,  8 Mar 2026 20:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773000167; cv=none; b=D9pMYvxekahQKjc6I9+Ix1XoblzG9MyfeeUmBo9Mt/zfFRkYUdClgN9dXGUyrLyU2aBOkxyDoGc0lYKnQNKo2kOxaUuIRYb9HO4llI2OsYnL0wzGunaXVh2PM5i9ORLqMt+5WTVhFHid2h/YLKbzdj53j1UZw3aXuflZaMyarZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773000167; c=relaxed/simple;
	bh=TToQ5G2JbDg75a+KCJJlKmBnsO4vGxsRL5MZn+NQ6sY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lVxd0evVLAJO+qrXW1yiuSbpqxE7Ah7XrAeOfDNDuvfXEdLIK/AHt3thcuQXQ+TCs9PvfLPzof0al7Sf20fxfvcQzpMWAgZ4fDaQBfKmc2znO3zj+OvZIOlVs2H9jr/m7ES/5U5MLJOcyoBpCHg86F2ZcWnWLQA3fkEavkjDMEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=IciRYRIe; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="IciRYRIe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773000150; x=1773604950; i=w_armin@gmx.de;
	bh=AN0T9f/KPWLXr5kVN8lNJyu+JTV3P5IvPZoYHnG15Zo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=IciRYRIeCOv/VrXZOrscjeCHrEBQ8zW2p+SW78BTIqRPnp1+eobQtJ2Zgxb0ToLC
	 k7B+pEOc5+0NK35KtzWD25cKsiltGOTlUyWY6v+vUvnjtuRLI6qkl8IAumQEeV8pN
	 s4p4eDhLWh4DaDwiUAUtS0B1xMTXJoJbzhCLuh4b59FhTG3FkqaE3EmrF9EV83J9n
	 iahPB6Ibm7f4xOwN/0P1nSs5z4VmHdoV6wbo1Z4RdzMDq2p8fxZXXuRyprw3wvaje
	 sLwhSKKfhW8KSyDv/5bC5YWcTsfJoKYaLlXKuHVNwhYlb+BIw4OlFjlQZq1xeT8OA
	 ibbBz1nooh2T8JaXHQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8ofE-1vcaQ748zm-00xd5Q; Sun, 08
 Mar 2026 21:02:30 +0100
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
Subject: [PATCH v2 3/9] platform/x86: dell-smbios-wmi: Use new buffer-based WMI API
Date: Sun,  8 Mar 2026 21:01:49 +0100
Message-Id: <20260308200155.118950-4-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:AN5vNvfQGI90uGTq+flGixPtoZnU20MPjRlMZGjvJNPdtAYfzf6
 cNcRPkD45eIiETplisd2QKtQ6hmVS2OWwStg+kpBFkHR4WKSQVPrWd/QjxahXNag7eW5aZV
 KwUgUGT7lm05vLewh65CeLOblxKQGhL8DRW6dYBPh7lOpH1BInzo5OeGBoy75cvLJUdHE1E
 zuPSXYujAGAYSbR4wpKUQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mwZr8X6pcMo=;ic9LBcVZUF7UykX2QOUGVZbCmDo
 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

Use the new buffer-based WMI API to also support ACPI firmware
implementations that do not use ACPI buffers for returning the
results of a SMBIOS call.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/dell/dell-smbios-wmi.c | 46 +++++++++++----------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-wmi.c b/drivers/platfor=
m/x86/dell/dell-smbios-wmi.c
index a7dca8c59d60..3c05b48354b3 100644
=2D-- a/drivers/platform/x86/dell/dell-smbios-wmi.c
+++ b/drivers/platform/x86/dell/dell-smbios-wmi.c
@@ -50,38 +50,42 @@ static inline struct wmi_smbios_priv *get_first_smbios=
_priv(void)
=20
 static int run_smbios_call(struct wmi_device *wdev)
 {
-	struct acpi_buffer output =3D {ACPI_ALLOCATE_BUFFER, NULL};
-	struct wmi_smbios_priv *priv;
-	struct acpi_buffer input;
-	union acpi_object *obj;
-	acpi_status status;
-
-	priv =3D dev_get_drvdata(&wdev->dev);
-	input.length =3D priv->req_buf_size - sizeof(u64);
-	input.pointer =3D &priv->buf->std;
+	struct wmi_smbios_priv *priv =3D dev_get_drvdata(&wdev->dev);
+	const struct wmi_buffer input =3D {
+		.length =3D priv->req_buf_size - sizeof(u64),
+		.data =3D &priv->buf->std,
+	};
+	struct wmi_buffer output;
+	int ret;
=20
 	dev_dbg(&wdev->dev, "evaluating: %u/%u [%x,%x,%x,%x]\n",
 		priv->buf->std.cmd_class, priv->buf->std.cmd_select,
 		priv->buf->std.input[0], priv->buf->std.input[1],
 		priv->buf->std.input[2], priv->buf->std.input[3]);
=20
-	status =3D wmidev_evaluate_method(wdev, 0, 1, &input, &output);
-	if (ACPI_FAILURE(status))
-		return -EIO;
-	obj =3D (union acpi_object *)output.pointer;
-	if (obj->type !=3D ACPI_TYPE_BUFFER) {
-		dev_dbg(&wdev->dev, "received type: %d\n", obj->type);
-		if (obj->type =3D=3D ACPI_TYPE_INTEGER)
-			dev_dbg(&wdev->dev, "SMBIOS call failed: %llu\n",
-				obj->integer.value);
-		kfree(output.pointer);
+	ret =3D wmidev_invoke_method(wdev, 0, 1, &input, &output);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * The output buffer returned by the WMI method should have at least the=
 size
+	 * of the input buffer. Because the Windows WMI implementation ignores a=
ny surplus
+	 * data returned by a WMI method call we emulate this behavior here.
+	 *
+	 * Additionally the ACPI firmware might return buffers with not enough d=
ata to
+	 * signal an error, so we only print a debug message here.
+	 */
+	if (output.length < input.length) {
+		dev_dbg(&wdev->dev, "SMBIOS call returned not enough data (%zu)\n", out=
put.length);
+		kfree(output.data);
 		return -EIO;
 	}
-	memcpy(input.pointer, obj->buffer.pointer, obj->buffer.length);
+
+	memcpy(input.data, output.data, input.length);
 	dev_dbg(&wdev->dev, "result: [%08x,%08x,%08x,%08x]\n",
 		priv->buf->std.output[0], priv->buf->std.output[1],
 		priv->buf->std.output[2], priv->buf->std.output[3]);
-	kfree(output.pointer);
+	kfree(output.data);
=20
 	return 0;
 }
=2D-=20
2.39.5

