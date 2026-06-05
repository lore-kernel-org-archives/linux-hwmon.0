Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705A13B3892;
	Fri,  5 Jun 2026 18:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683309; cv=none; b=T1fucewdvQzMlsnWbQosWnGIvLYDiap8Y7aEjcs3Lhg0PDxhtwfCFiZM3JSjgS8bySWr1UGkmX+KdDvIIi5/MHxG+SIV1r2cNqzPACY4WWj3V9z9n3YRFzoMQnOZxMhWyVx/K9AuF5h7SrkoZr40YwUfHSq2/dL859jMGyqgqRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683309; c=relaxed/simple;
	bh=W3THHfIlBw4EfhGFn4fMDV4RYz4Xqd76fqVyB+3Ly20=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uxJ58Qp1icbM8tUKLRMarxrITiNBpSrnl+NzQWznj7ZgwqFNynOgriAyXePsYCWWwJY36t7J1X3SCQpQv9FN/TpGEZvvCdQ6nbL+pAosMXvYeCVWM+11zSKdQSlCULvvOXGKfH2cLCRoKrKX73gYlwgPkzpQhS8D5xl9x4C2zOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=n9qm5RFF; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="n9qm5RFF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780683281; x=1781288081; i=w_armin@gmx.de;
	bh=SsErBAw2a9ir3sxsOtEpGKYSPmBucPxoQbrhZs990pw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=n9qm5RFFGGJFc0jC2mLg7nCUn7X7yJ+9JZnujpToVKjvEwf0IUpuwGyhLjkKxOOs
	 FDXgDlvhUN4hY039pxCEkOKnyR1CS/m9v3TjyVUrmQ10GbcdPfTPSg+o04Y3Ig317
	 FNPIhQVEX3MYV8BjpHtke5/SxmWc3DszdT9UeYODNMuTMODqoqLm2jE63LZmi34zY
	 dNEp3nfhNZnX0XGQXJsd2fHZBLeePXMAAVjCKLbtrfEuYalX8BGm8cP8ZQh5TUo+z
	 bjmLCOxhTxCHnuPTWffTlXhA3yptFnP8YC67x6nfRc3jqJco/BTPZ2E4zMZ6FVzeV
	 fX1HePIqCTZDOy/pGA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MpUYu-1x3pYj38NY-00bKCJ; Fri, 05
 Jun 2026 20:14:41 +0200
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
Subject: [PATCH v4 3/9] platform/x86: dell-smbios-wmi: Use new buffer-based WMI API
Date: Fri,  5 Jun 2026 20:14:27 +0200
Message-Id: <20260605181433.188847-4-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:ZT1jpODSmo3XUY5QLlk5SRnnjyf+zCraW1Usckc3fBsESPDT7sb
 s2JRc5jVOGv0GmAVysC3mxs3t6i+8HSw6GnOZ3szsPmRV4JcfFFyU89RiQ/oIBn329l3MLO
 cW0tnzvI8cJ1Tc6a9HEhfonLW3qm2IrmLvcmmUghf9yWtAZIP463vsfC9xMzgbuQa7gzK1b
 8CTtBsP5M87Dm31Wsxfsw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qqWixgnhq18=;JBuK/4A2r7Edq+fsfjiBPKV+hAO
 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
 Wwb3Q+F4kZa9pLvNN3E2LHXy4iM=

Use the new buffer-based WMI API to also support ACPI firmware
implementations that do not use ACPI buffers for returning the
results of a SMBIOS call.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/dell/dell-smbios-wmi.c | 40 +++++++++------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-wmi.c b/drivers/platfor=
m/x86/dell/dell-smbios-wmi.c
index a7dca8c59d60..64d0871b706e 100644
=2D-- a/drivers/platform/x86/dell/dell-smbios-wmi.c
+++ b/drivers/platform/x86/dell/dell-smbios-wmi.c
@@ -50,38 +50,32 @@ static inline struct wmi_smbios_priv *get_first_smbios=
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
-		return -EIO;
-	}
-	memcpy(input.pointer, obj->buffer.pointer, obj->buffer.length);
+	/*
+	 * The output buffer returned by the WMI method should have at least the=
 size
+	 * of the input buffer.
+	 */
+	ret =3D wmidev_invoke_method(wdev, 0, 1, &input, &output, input.length);
+	if (ret < 0)
+		return ret;
+
+	memcpy(input.data, output.data, input.length);
+	kfree(output.data);
 	dev_dbg(&wdev->dev, "result: [%08x,%08x,%08x,%08x]\n",
 		priv->buf->std.output[0], priv->buf->std.output[1],
 		priv->buf->std.output[2], priv->buf->std.output[3]);
-	kfree(output.pointer);
=20
 	return 0;
 }
=2D-=20
2.39.5

