Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C103370E4;
	Sat, 14 Mar 2026 17:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773510814; cv=none; b=M4vFleFbNGOQShLZ+OPaZSuGRnpVFPoSkAxRBWIxSB1NgfIei5ZogvxiXLWECJA/p2OvMXmM2+hxkUG4Fe5mqny08yK/IQ8jM+A1CAE6BObhXnfNBwYD0Im9h0xkPrtqKHmU4u0sDcX1epysNtulSi8j3OsuZmk7jWiOAuOn9dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773510814; c=relaxed/simple;
	bh=TToQ5G2JbDg75a+KCJJlKmBnsO4vGxsRL5MZn+NQ6sY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iMxINVfO+RJORI++NLtILu5DQC1onyc5apE+dvN1yyu9GkV0GNYqRrqmRz7ffxQa973xYBy7eUHwtXThhqB8CJEQZOYJZr91O/fSeNbzOkOOMKLbHkoUO6BFUC8/A2/IasKGtjKLbeS6+LUrm0wzAbuf5oBkFFxIvfgBtKIU8SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=CWNI9a4u; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="CWNI9a4u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773510788; x=1774115588; i=w_armin@gmx.de;
	bh=AN0T9f/KPWLXr5kVN8lNJyu+JTV3P5IvPZoYHnG15Zo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=CWNI9a4u5GxDXbQDXAe1dnDBStC1C22Pj7n+jkD0aY4mc9h+cjYrcDtfXK8Pe3hD
	 XuUc6zurokBJyWtKFYpHWhskHoC3rQmyAIGVOG9+bAwWN1tsYfHMwJaVtVslEJBwI
	 DA89PuNP8O/8rqeSDyfOYunTe2oRMWz56k+nq1xMK3nGlXYZl3q1dFoU+Kp3JklOi
	 IPiZdpfsfJWMjyDYCwY6seoQCYHT0kSmOMQKkdXPJNrFnytTOdw6JZ4KQoF1jOJsG
	 myWi5rjZNSfvfZByIABl2idBopyEbB06uI1mx2s6l6pnMcryqCl55zaNM2WqbE91/
	 NUR3GpumJvKyavO1YA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1psI-1w3g673okq-0036fL; Sat, 14
 Mar 2026 18:53:07 +0100
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
Subject: [PATCH v3 3/9] platform/x86: dell-smbios-wmi: Use new buffer-based WMI API
Date: Sat, 14 Mar 2026 18:52:43 +0100
Message-Id: <20260314175249.16040-4-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:M+EE9+d9UPwBRioz5YteoSniUkWdiYOpaWRHu4CLsv+vHF0rE1+
 sVV1gAxOds07W4n0op7W7roJ9wMPnyyk7vN5bYhznH9L4sG+nKn4pvMHDVENh/m0SU1NCpa
 0zNxUQtGv7vhiaonIjnVkz+BGWf3rdc9AoC+yTyOx/3Pap8J5yw4V5FEvPfR9tdn7hk7xW6
 QWriaDWZGor6SMcVBGUGw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NDHqVn01dM0=;dCAzQojki87VzRP1l+zjCrsymAR
 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
 vdH85ig9/Iy

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

