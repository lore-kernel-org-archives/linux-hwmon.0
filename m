Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7400A21ADA4;
	Sun,  8 Mar 2026 00:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772929558; cv=none; b=njtVDkxf3FnixJ1V+QN3wfJHV6evOLaWBcxuvu/XP3wE6uJM2Fs7dCM9dq2FI9amsxNu4MvU7P+3yxi8rHO/oc9/O+K/NP791/2pggV8mhQLWa8H5b/XApR/wo/pa//MDLnlI7zYBjOd7cMyEbihUQfXsiVCJDYGwFNe9Wg3Zh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772929558; c=relaxed/simple;
	bh=TToQ5G2JbDg75a+KCJJlKmBnsO4vGxsRL5MZn+NQ6sY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jQ49KNr7lvl7eIXbRm+kurCLDs1C1FrWlyK3/to14oyUosAgtqB01+G34oNupvyawzT1Rl4pvi68AGrv5/I5ES/KTlTvlN4zDM2dx542zltw8lYIfQdXi9tF28IEXtPZUdkSPsyCSRYxGtVaCHBnCmnKPIB3YvZZkoHyiDxtN/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=oiduIOJg; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="oiduIOJg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772929533; x=1773534333; i=w_armin@gmx.de;
	bh=AN0T9f/KPWLXr5kVN8lNJyu+JTV3P5IvPZoYHnG15Zo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=oiduIOJgeiL4OzV8So9csTSPfbsr6Jy0o/dtkPeGcX66b4HXI8i1cX6uNlLHQWs5
	 T/1JpHPnCuZF4Bm707oIxkjSqPVqtsJlkjg0/FPn98Qqgk+866q5XeQTZwKDe+Cba
	 qK8JbSubIBIYsleEkVfjSaEoKQJma88QS8EK7pvd0ZsIqUobrRCTCfkpTa7i1hgB2
	 yWVxpdkA0uHrGnJjMKVkCpSgPn8NEawKVZYseVRlzdmsiHL97G12L7ev/6nRcFBx/
	 I+hlF+fXHfZmmuCj6T3Hq5cs+P9gOcI5Ss6R2sr5SZj6c8Fl8dvsV40RLvblNZOQg
	 VhUjvXkcMYmleEKMoA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MOzOm-1wHgrg3oi4-00Sg2d; Sun, 08
 Mar 2026 01:25:33 +0100
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
Subject: [PATCH 3/9] platform/x86: dell-smbios-wmi: Use new buffer-based WMI API
Date: Sun,  8 Mar 2026 01:25:16 +0100
Message-Id: <20260308002522.4185-4-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:BrOqty6lrrCFoyDTO/j2VBMmqbtDtRGDvxr7cRbKnNxDJ5cOQTV
 TaW6DQn+COlKP8aKjon75VpX9NTb/a0D2y93MMNzWKzkVp+oX5BLnQRX/Rbn8KKCW0mtEB/
 crLH/SIx6le7NXfWgDuZL0DpOLQXmZ+wfgcJCxMGvTfMwDMiCS3T1LOVGdyPGmHLDQ80Cwt
 AV+bs1Hl2eQ96UiTjcR4A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9zYCcyRVHwA=;6FGYivqhiUSRJsj2ZccPDJBQC7M
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

