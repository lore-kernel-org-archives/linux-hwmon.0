Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC358481FC0;
	Wed, 10 Jun 2026 20:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123719; cv=none; b=jFIhCmHaRMRGry8PsCau3R5CeqPdrLgwQ8uYKKkifwAQQ0vZfImkiJaDgRfA7Nxidr6D0YXNZRBeuxfRfo5SxFpxf7/Ds83vbyAjk49bNFJQ6i86SOqMtzB2+GDU6YzDRqdsupXXMS/l8O48g1D5fZ25T3T9q2tQWJYVPWbmfHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123719; c=relaxed/simple;
	bh=W3THHfIlBw4EfhGFn4fMDV4RYz4Xqd76fqVyB+3Ly20=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K09Jzyd4I6eIj4Z6XGt8QcM3K7rWD2hwM6KINe2ecQx6PqdSb9j3obTvyMzNNhNgZStpNpPio3XB2j7pJaE/4FdI2Hb6nZT4kyE0MIasaza+MLHb3376s3rSWfX8DsbP4qB3QKZ0gDC2pwvF0dzatg+8b31ZRz+BP9m5rc6aap0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=aaz+g2zR; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="aaz+g2zR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781123709; x=1781728509; i=w_armin@gmx.de;
	bh=SsErBAw2a9ir3sxsOtEpGKYSPmBucPxoQbrhZs990pw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=aaz+g2zRUZVmdFJxq0TBOACzNMQ9evdI6f0XuGMUPTsa5cJNSv0u97AorCdA6gXY
	 HKB0p620aLDZA/fmP2Fw5vm3yMSy9hoUlc1Q1dm0Gbi5Q5PIAxX1t/tWevSLMvNUz
	 LoqiSKnwvf9e64RSExn1y04Wuc/Q1j0rf/UxFoOl2nBcKD7GCNbteX9SAdQCRPYkc
	 YT7b+DyIi6YZfii8C6OX4CLJNF1pzHGY6d1Mg8xALwtR5gajUOd5a3ZupfN1TqPWc
	 Xyp7VcTt5U5xufEJz4CaDDNZ3BSvLSR/YXKVjDc4iVbukHQsdRXqybkBna/YPO7XT
	 qsAKvQXQluvsTYKzsA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbivG-1x5uuQ1bGY-00jDKC; Wed, 10
 Jun 2026 22:35:08 +0200
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
Subject: [PATCH v6 3/9] platform/x86: dell-smbios-wmi: Use new buffer-based WMI API
Date: Wed, 10 Jun 2026 22:34:47 +0200
Message-Id: <20260610203453.816254-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260610203453.816254-1-W_Armin@gmx.de>
References: <20260610203453.816254-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:16Gr0/yJmTYHI2S+PGN/8ujRNC/rwnWEF0ZtdOt8VwiNdcmsSLs
 ZeBsRN/kSkhtdJVy/+nrLkrRM+/wWbuXfME4y562uwtcxwZWgoAXv4P62MWBCL4ZLWCPCof
 QwpLABXgxbQT+592ZZlNJbqaLitoPYcT/2Jkjid1PsJfNMaSci0V0JM0PAlF+3nJ0utGDY3
 rRx9ntHKkpFjfLt3WB5sw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ob0S8nvSiz4=;yZ0vbpgGD3TcEw1DXu8+PyuMqaV
 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
 G4cxWJSAWYirZ3G3WNxgZF/Jh/8=

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

