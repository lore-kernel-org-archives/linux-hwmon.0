Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4BF26F2A0;
	Fri,  5 Jun 2026 21:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780693210; cv=none; b=QIPyXwxpry4re34TVtJFDanr2dXeVSlCTyitm0CJWrnoEtc1jEvyIJNi7Fe37V4sBbixoWgqqQg5za1aN/rbi3snaeNuzCKqyJwVcBNhdy1bApKhhWiZ++F3mBipnjy2c8zMx/ECA0ZjT/U1zAGcFI66yiXe3V2b6kGeoxSuKPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780693210; c=relaxed/simple;
	bh=W3THHfIlBw4EfhGFn4fMDV4RYz4Xqd76fqVyB+3Ly20=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dsvwHFmfLcRGH/AHQPOpORGufx+kxU3YRW/TuddxIocQxHsTzXEOoCS0Vf0xFC8NKrIxCQRv2obrYh4vvfLG8B+SF5zmDab8rSHsq8ilVguba5Il8iv0BPbfsx5CxPsApjhsYgMR/0iVJpsg+62Q+tU8T4XXxUmKV4+TyX7Zf0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=UUjoNIra; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="UUjoNIra"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780693186; x=1781297986; i=w_armin@gmx.de;
	bh=SsErBAw2a9ir3sxsOtEpGKYSPmBucPxoQbrhZs990pw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=UUjoNIra4rET0wIy14v2n6UUJw0B+ivcBTu8ottnCKgOqz5TQYW4FFgh0kHbykXL
	 Q4nja3c28wEG41Z4oqHX115c3VwTLLufouA7jHJjieyH0pR3tHbF2usNzfyKM4j5b
	 QXS7dyePLYQQ6l87q6dMKFRMP2WoDPJ/9sqj9B9/dz3SMHix1OfSVIhweg5NKVxlR
	 Wf4H8cp3zIivDuGBcITQBgu65zlEpu4qf3/lw9fR7Sx75iN9LnoIDuvuj11+FvdcY
	 FAIJVIU7VwqSPk3/5aphY4YXp0gDec0IHWIGfuKiSH9K36tsh/aftL9Q6ISKXio9s
	 yY9a3rVwWflsgKNbLQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpDJd-1x2xnq3obP-00iKIi; Fri, 05
 Jun 2026 22:59:46 +0200
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
Subject: [PATCH v5 3/9] platform/x86: dell-smbios-wmi: Use new buffer-based WMI API
Date: Fri,  5 Jun 2026 22:59:31 +0200
Message-Id: <20260605205937.530897-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260605205937.530897-1-W_Armin@gmx.de>
References: <20260605205937.530897-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OEtbwefhvUGbllclEc3okh18UM5/iyDbAnKhx+giBirF61Ww612
 idcLgZtsAtPLyBLPyby0v6XhKfxe2wYcoRtBSJ4gX3T9QDs3dPL9NBankKUwsSyIZyCRNrf
 xHid5fzKCFRRSmFqwAohsgpbbFOKVnt/lV+oCAzyK/1XeyhPl3UT2V4vNAG0JIBPADRUVJW
 K/mgD6JMvP1rD3PrK9XfQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:iNpI5kEAtqY=;t/AYYNM2zim7o1I9Yk5Ztg/qzSy
 HPuSKb3uJRV5tQht2SdzaQ29fAwiQOvej+9lCU7UcAJJ3Z6k6G+RQ9sp/VthbiZzovDKIwZxv
 LVXvA7McuK8AYBnyXr2YUgDwWY1tal10dVmL4eL/fs2rafMrOYLYdebFaygQKhKF4YKjaQEhv
 Do/dOyQCrp8Yskg/9avKRZVQljGnfQqkxBldtVKkaMn32MOd9oAhh+YBaJYb26IdWZ0r2CDpv
 oQJdYDUl7HclKzuI/J9WBz8yzbfo05k+6Rw1f1SxIsWFZ4YUYthtQ3193rtJ18UqeUKK3kBJ1
 BVRWukDpc2Cxe1y+MX49Sr1W6btOXbhRcZVbp2FSGL9AJHsarO7zqbGUKMxcjc1zq1UNwqPwE
 jPi/3R++aS+BktbNK9mjvpOiFot7v8plGc7ab3bKnpoqTnlFqnk6B9Jwicb+QgxuWz6UzQmxh
 HrBvG4TmaoFR/BpwQyk1RKmFJ9tB/LPbIk8EFvB2oYYrmEy6mWh9GL7pIeDp6LJrfsAMLVbn/
 mUt+Slo/tDVSwSCYyQgXp9rc8dGfk5PxDf2GrNg/CAPAwXy10N/+idLjvM8eshgZSU+wcTB/G
 pBad/7/wgKlvwScxUHjvny93Tw5s6AJ9iQv+5fgBhN+0XkSLae99oKV6Uxvk1k41xwf1IbZRe
 lHM+hMjQBHw1s34hiR6tkZ5fRLj1qxOCQxn1J9qGk3yxCUYgxGaJTN4YvH5/jHp2L/+fjNP9V
 F7T/bx/CtaExdKHaf7ggNb2yGJIBTXMPqRYfMDqFV0yiTc7oTGZUB2CLSZONGuQtDtSAjGtV8
 Tmiwv6SQQtJiDO6pztBJFqyXHkUki/Pqni4IrUGyfNO9vqkBs7gKv0GsInlHMTmYmit/hISKq
 MfUOQJWqLlFD+6aR/Wz2VaC/Xq8c8/Z/ABJmxsmwViqAsCQkH6M5mg4xk8hyvOP+5VxYI2hiA
 Y5MvVvLNzHUHeCjTc20NEMZU/kCLCR7BNRqx01Tk831UCNpTsYCIk3YqbJ8dsoRZ0Njg0AGi+
 BJhFz6apOM6nP9dF4h6JyCXKO85E17xTbA3dOGjMNy6wexjGoF5hzhFhw52F8RI6qkGqELJFp
 xxnX/YRSTlGfFBiIyi/Ng9x1UubVAmFOMgrWaMikJTt7r19PQpP2lmDB9lj0uQ5nd7j91GjHN
 3N+JKQd3DQAGps49vuQxADTq0kmA71AAAUKxhMxLeGmTwgAww0Ws2iwnaMHEiT3DQKzgphcUr
 Qv5D/ImiflMX9AUNvvi1OMByEBPrK1+msQ1GjZ9ryGAU7ntL4BgEHFyV/xiLhkVil+dzix8vz
 cGENMxgY6DmDXe38NkO7shIWoVEUEywsK9nCBavu0aNmi5GuwIAPNIoISHIp/S45vip65zSFq
 qp1iQyARZbp0lWFQfw3sDEjr1S/00ryae3m5P/yRSjJ/S8JlcW/Sx6SFPNMEmm9jVhIQikcY3
 3gMBR0KQdfSeA/sJNWqcw6IEKd/g4idbUzmsrJvu33bSmjxSM/QDcOSqEI7EzmkuTHJJB09xx
 4hMpJQktXgCgnlmjGfJk3eqG+Rvrxwq6hI+tJ/DpFrZ+MwUtx2dRVd4MdHrso0XjfbECoNpVt
 x7J20oTNiGBy6Ab4/WYFxZxa6HKSgvPVXe1GE4iVu8BCmFx+0sEr83pgFl4Uy8r0g4RifhrYy
 x7E/19ywZGiHXXGImLZKJRCThJ0aHAUprfGnyuj5+w2hT7zNlD22DLb2pAfL042oC7DniNVbh
 bwSLsO9Pxpzbs5OrIyi4YPt2zLL4Vk0juWiWtKJBo3VvtZsSEUT38XaBL1c8SQAVb7XMr59gn
 6Wr2FGzGRoQjULLDziRM5YCTCvM+ZPsmhvXDtDz4nXx4w4VR8/q9qKtJPF63NNR4j1KBVYrLB
 DZyo6u4AqI9iRJi+f2KdSgmW4/4IL9HxnBmFgvBwqrNoZE3n2QdAu+CM0+zBNwzeS2YX7kzHf
 RaEIt7rVuovodYUyebyn1gseNf//mEPpxmLg9FhZFu8gqcaM0r2xbb3MBqqEcQLj3llZwyJvG
 C0a3sy+vKHtDSLdHriMQRhY274TyVg+szrL+6VlN11W1iZICRk3UDQN1eTSATyXPseCVGe6ch
 Ef+xolblA24rsg2tatZ5F/Iz0mUoI+AxaXwHjysi3W4eB8Zb9NRmRmSMKyhq7N2lAnxVt4ved
 Gx1cVqFrR+ENk6r5xI1sidyRPWTASWf11g0aQs2V5VURB5AVmjOo9mkfa5GHXLtIh1YH4Bunn
 thB+l6n+INUBLnosYk0Pgf961QKanTQ6L4H6XHxfIejjD8e+iOsD5T5mk2mjhecASFxttmX6M
 W4F1XES2GNDd0F9hmWQo7WNZWQxZsmiFGcobzZQNdEIMMRYn6VlaJreRakpptdspXD3lmvXYU
 sUhHTxIw61TdputjgUrdj1OTgAzQrqlpuwGA/sKOcEUd3ETQ82N3urO0aKZd64Je3L4PMUnXc
 4GULqeL7p0icghX9rru9yBc7pnnhxoKQPiaHNg8Zwwr4xbjqKH9POkFlMCRxzGY9QYKWsXKBH
 yZe9vTq9/qUKksu59K39naNQ4XGdP2x2FWLHez6zkD1yZ76YDX1+KfoqWsW8qe2g8EeRWx+/S
 bmPfmtWsw+7OMy6knxOsfzN2SYb0tgtejEmftXp/0FiwKhJ2VP4OQv1sV3KL0jEblUQY6x7Fv
 FnWY8mmbdgCdQfTL36574iWySOGYF0PNOieMFhyvbfOHPOjV4mUn4Y0HOXviGhOdTQ1abWYxS
 Byr5eosHXWvbet9Lpp4SV2Wt/UBnn1X063YC2iJoOlfCjoFj/SlHXGuGXasOrEeII3F2BBUm2
 QS15ENR5H343IEMLpZHr6Y4+oh1PxX0SCjXDeJAOdRZAqrzfunrcdmGc/jEGl0Qn8SSnNEU1d
 x3CJSInbpa3Leaf7z9a34JH1g8WU+llsGBUdsKc0KpHHhcrgyZGVl1e+jmYotPFhE8q+A7/nP
 qRxmgZRfL2eflemVbwNn+onp2jOE5378JuBB0x1FvpJNhuqLzOAgAjWNdcqwpRU99K0GVXI9O
 3z6fu9Hzp4NKaZrASxPCUexEnB09OiHJICMSovuiWVeMY7/Aw1JuXEHLjMh4Tyh7dBs8FHLzN
 wblNXj2UVq2ouELQ4WiWsilReXm7TS8lu3li5S6+GRbWZf7uTQqifZg6miO76CH4wohDOiLAO
 pCuaZfq+2aQ/n+Qj5bb9VrKLsr/m2IalBDLE7lKXj8HhhY4fJcbdd7sRxuvWbNjKoCFR1PFqh
 VwNP5WK8rX6hA3S3Rw6GLHkjVSqP195p7BAov8hislbdti+u9AVQQ+a9bWe2mahkAjRbV4H4Y
 nfOdrI6qkvoZaD3DMj+aTvHD89atg7kCfB5jBoj54biQi+2yleqFBiucUri5847jNoXZG3Nms
 9Dig+BZjKTcp/x6Wo7gCHYkXLZxJakZhdYoawlxRXyEyivS8SjxxrIaENRn8AerMvzcTTkwWY
 tYTCMvAtlCL7/1XX4xVb8zb+fxUnVahiT1ioBUXkI9jilz+BtGvmpBTG7QmV2ka8PLm9169Bw
 hfWkFpHkpQSLpHg8GqfOE7hgS0/66kEl8wgGMqBD6vAIErKaJmo4Apvoc5QnDNC4UlVJUkIr1
 GMzAwRNz89KBNKplm++TFyr87adKyVDkfdw/iQbO0XzZ5gHeAED7TaIHJtfpneTK/CngkuCrV
 0o3fjl2TUEhM3gQBEZh8hYDdUWc+Kqtgi6kqwVsiPGiyBhPkruQnlIvWgqIkd3Gh4en9xszLc
 HWPXAQSkhjJvg+ajMh1FstEjQbr26pFHTqH/u1IG5/Zuy8FjcgiEBAxy9dIv83BIJGRqFi68u
 EH7lBJofpgHgjZavP3JMvc2puCgCgAqR9JZA2zsv7EaiTrvulvfP+t71OGV7OYt6ABYXCucry
 m9LD8DcQLybQwU/ljVD1zGObT/c9tl1b1DN/cQuSzKJQIK9l/BkkK9yV8eGDvtK3KtUmzDRoD
 sDcVU9y35dkUhS+8UDuzCR5QDEMYroS4NYVDv6W9egYNOdSFuE8v/KWRaIsEeR+svCf5ldFoJ
 8GrmwIYGs+VgfO+VJeqQL6WY9hv4Xn0FfjidDtyXwH9IARSwpPgmpXvp5UdcfIG/u5AJJAP/J
 bfX/mjOIDagbqfBryU8RYRQxoVYjlWnws1WLo/q3DcQkEb4ptFRxwEKMtPkOAK6O1gKWL6PX0
 jO+w8SB/38J/zGMC/fLf4+68wwApkyePn4EID3ZszuN2uBixR/myIJ44eQqq89aJDqy9S06Fs
 uo17Nw4N+VnrhR4If4OaWVJ0hVJtgoSXjL+nT7H2pQCKcfzOqFwnECHm33LpoTc5CoP9RDspY
 hN/2mGw18W7fgmVW78pgw4fR1O2g07V8SNN4On7jdoU4PWJ72vfPTGe+kDPRZL3h1T7V5uIMa
 P7Zq9Yehv5qS+bGoYHVTiBjmOLJWEVCZ3SBAgZuYLMqwZ8yLonqb4H8A8JHhnYihqAhtptgWf
 YwIm8niThCr8kd5g9gEsp/FU93Mt20FSQZCmcO6KKK+wdD0/6PcvxTRfhWSX3cg8ah5cGc6pA
 zHGIfPs17PSSeja9yR8sxBPFhinqb9TiXcLApOojzVb+rZQ9YJidoLGc8bcxBl09xAQYUdWxV
 fx0jttteCBddk2aUvNdgjk+p/MUr7bDOWVKkQMweSD977R4mSkLoFKoSbI8wbOr7XUjrG5taV
 NQHbKoCbghaFwysyT5dq91xAeukrMAK+afISAufTdckPr3o6FRW7OwDdVPILkfOF7JA5884lL
 2QkeJMAx9n9He+hlXfjc7JfJh4aGFFfIOWQ1Ns4R1XV3Q1+G9Rn/3FRCEveA+FPTKFvWCK2YK
 VmD8/rZbnSuVAI6bqxMb/784hYf33RRfnJ8tbTx+QPFRgBmSlLzcc4A1O9xNLNR4xi5ik4HG5
 orb4KWV2XyKo9hmCXDa/xhjdcup71/LkNEnMkNkIVZXyyn+g1UarAgFQyaHQ8NsHY6e89s6ti
 WzuQSvYFZ5WXAqp5mfwoGhxisrTlFNAJHc28oL7mq8V6X/iX7OIYB6gTRF49EQdJQUS1TM/cD
 Tge4/sHwbih5y//76EypdEF8iIChqRcnVH0AzkFhtFZBFqlXawtOdMbkr0K4uKBNHBgSjx4nc
 2iXrQfHPFqgeD0iwr3L2NZ30GKe9U3ib5dHjwi8H5IAQO9fFWWgp8xh92f0qw93qyagkbf2yv
 q3UBsxemiFHRAtVw0TEdf03/xE20obmseE6NORRvLs30G2IV4Zj8I1IGvYyPf0fApEc0rKv63
 JNWn72yG6yYKtCpDZI7xjpWbPPsFS/w+f3oBpMjuSe+AxjPIPV+FmvqSWKjTzO2r0EX+7oMRQ
 /dccJsUH4Zyr1Yye4C2ppbGy7oWIgubTVAz4q+VIJF/4rcNdNqvMpVTONhlgtRQjFfuFjxBXt
 dh0MBWfV7P+SyQCbKV/WU/f2QKjtXJkn3vyixWFvMZHSNVahnbHrcPTbAhxwzt3LV5sP+FEF/
 quy86qhIadS/KiQ1eDaGYooK5Gmba1lUqWjozxD8F0KttwIW5hLyoCgKGSdMFTTg7xHngg7lv
 h7GLtiJq+P2WGAqELANuwuoSC5M=

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

