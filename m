Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0744C001B0
	for <linux-hwmon@archiver.kernel.org>; Tue, 15 Aug 2023 04:58:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234521AbjHOE6A (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 15 Aug 2023 00:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234449AbjHOE52 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 15 Aug 2023 00:57:28 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C00B2107
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Aug 2023 21:57:26 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-76754b9eac0so341126885a.0
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Aug 2023 21:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1692075446; x=1692680246;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VbhEpCyeq249kaOr5uO5P2KyhnYUq4A1aqtnBehGNjE=;
        b=AfIO20CoNo/5R4UqVDxtUyCBV3P0nbWbllm9kfbdXHsc7A5kyP/TJ1rkJHtVSi9gnX
         MFI7xyAia5WkVsVJbfFXJpbea4su5kuGilgU2lpgrzpgoMb9aczGQ5JHcdtxMykkbLul
         vVDdWVC8+s5Ti3j3WXMdyyoNd+NymsfZl4fL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692075446; x=1692680246;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VbhEpCyeq249kaOr5uO5P2KyhnYUq4A1aqtnBehGNjE=;
        b=gdrshijhj/PRiGemHloVzvB9hL6orNMfMY92QqNDQ3ibAp5znpS3S8qml/Wbiz5OVK
         FISznwUkSIoWrp87jIjKSaBH5Wjo4CM6CEBSOf0iVLXqhMtKKGu7kCPTgnMe+RZBFndV
         GZ8F7m5+GqV+0HEDU0A2TJ6YbPvR/PQ/NRXgqXV7VmXGHUaz11aoCQ+K2UqYAIxAE3ho
         jEif7xxD4aGwY9KGkpgMtAQwN0BFCjTHSLemTMBE+G+JDX5N7Y+uFHd6zlA0kt2IvFGM
         AggHBWs4MmYyjs9OmYgZd+y/MoFcwIiTZ3LVSFe3qW/Z4yS9utKfR1eQ4VyefFPotXM9
         DCvA==
X-Gm-Message-State: AOJu0Yx65dv+EMRVLA5cE1eCPndaVA7Rp22Mg5pvq0aeJbYvK6GnBgqw
        M4xJdYqNxTX2tChs9BGmy4LxYg==
X-Google-Smtp-Source: AGHT+IG2k4bBElh/8j4O0JVjBOPeNVlChbOdZ6io4Knd6qQwqwQ+Un8S8OO3BFupxCg3uTizPptwBQ==
X-Received: by 2002:a05:620a:d95:b0:76d:1232:3731 with SMTP id q21-20020a05620a0d9500b0076d12323731mr13965392qkl.27.1692075445045;
        Mon, 14 Aug 2023 21:57:25 -0700 (PDT)
Received: from lvnvda5233.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id k28-20020a05620a143c00b00767cbd5e942sm3516575qkj.72.2023.08.14.21.57.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Aug 2023 21:57:24 -0700 (PDT)
From:   Michael Chan <michael.chan@broadcom.com>
To:     davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, gospo@broadcom.com,
        Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: [PATCH net-next 10/12] bnxt_en: Modify the driver to use hwmon_device_register_with_info
Date:   Mon, 14 Aug 2023 21:56:56 -0700
Message-Id: <20230815045658.80494-11-michael.chan@broadcom.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230815045658.80494-1-michael.chan@broadcom.com>
References: <20230815045658.80494-1-michael.chan@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="000000000000e700140602ef0359"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

--000000000000e700140602ef0359
Content-Transfer-Encoding: 8bit

From: Kalesh AP <kalesh-anakkur.purayil@broadcom.com>

The use of hwmon_device_register_with_groups() is deprecated.
Modified the driver to use hwmon_device_register_with_info().

Driver currently exports only temp1_input through hwmon sysfs
interface. But FW has been modified to report more threshold
temperatures and driver want to report them through the
hwmon interface.

Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Signed-off-by: Kalesh AP <kalesh-anakkur.purayil@broadcom.com>
Signed-off-by: Michael Chan <michael.chan@broadcom.com>
---
 .../net/ethernet/broadcom/bnxt/bnxt_hwmon.c   | 72 ++++++++++++++-----
 1 file changed, 56 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_hwmon.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_hwmon.c
index 476616d97071..20381b7b1d78 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_hwmon.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_hwmon.c
@@ -18,34 +18,74 @@
 #include "bnxt_hwrm.h"
 #include "bnxt_hwmon.h"
 
-static ssize_t bnxt_show_temp(struct device *dev,
-			      struct device_attribute *devattr, char *buf)
+static int bnxt_hwrm_temp_query(struct bnxt *bp, u8 *temp)
 {
 	struct hwrm_temp_monitor_query_output *resp;
 	struct hwrm_temp_monitor_query_input *req;
-	struct bnxt *bp = dev_get_drvdata(dev);
-	u32 len = 0;
 	int rc;
 
 	rc = hwrm_req_init(bp, req, HWRM_TEMP_MONITOR_QUERY);
 	if (rc)
 		return rc;
 	resp = hwrm_req_hold(bp, req);
-	rc = hwrm_req_send(bp, req);
-	if (!rc)
-		len = sprintf(buf, "%u\n", resp->temp * 1000); /* display millidegree */
-	hwrm_req_drop(bp, req);
+	rc = hwrm_req_send_silent(bp, req);
 	if (rc)
+		goto err;
+
+	if (temp)
+		*temp = resp->temp;
+err:
+	hwrm_req_drop(bp, req);
+	return rc;
+}
+
+static umode_t bnxt_hwmon_is_visible(const void *_data, enum hwmon_sensor_types type,
+				     u32 attr, int channel)
+{
+	if (type != hwmon_temp)
+		return 0;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		return 0444;
+	default:
+		return 0;
+	}
+}
+
+static int bnxt_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+			   int channel, long *val)
+{
+	struct bnxt *bp = dev_get_drvdata(dev);
+	u8 temp = 0;
+	int rc;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		rc = bnxt_hwrm_temp_query(bp, &temp);
+		if (!rc)
+			*val = temp * 1000;
 		return rc;
-	return len;
+	default:
+		return -EOPNOTSUPP;
+	}
 }
-static SENSOR_DEVICE_ATTR(temp1_input, 0444, bnxt_show_temp, NULL, 0);
 
-static struct attribute *bnxt_attrs[] = {
-	&sensor_dev_attr_temp1_input.dev_attr.attr,
+static const struct hwmon_channel_info *bnxt_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT),
 	NULL
 };
-ATTRIBUTE_GROUPS(bnxt);
+
+static const struct hwmon_ops bnxt_hwmon_ops = {
+	.is_visible     = bnxt_hwmon_is_visible,
+	.read           = bnxt_hwmon_read,
+};
+
+static const struct hwmon_chip_info bnxt_hwmon_chip_info = {
+	.ops    = &bnxt_hwmon_ops,
+	.info   = bnxt_hwmon_info,
+};
 
 void bnxt_hwmon_uninit(struct bnxt *bp)
 {
@@ -72,9 +112,9 @@ void bnxt_hwmon_init(struct bnxt *bp)
 	if (bp->hwmon_dev)
 		return;
 
-	bp->hwmon_dev = hwmon_device_register_with_groups(&pdev->dev,
-							  DRV_MODULE_NAME, bp,
-							  bnxt_groups);
+	bp->hwmon_dev = hwmon_device_register_with_info(&pdev->dev,
+							DRV_MODULE_NAME, bp,
+							&bnxt_hwmon_chip_info, NULL);
 	if (IS_ERR(bp->hwmon_dev)) {
 		bp->hwmon_dev = NULL;
 		dev_warn(&pdev->dev, "Cannot register hwmon device\n");
-- 
2.30.1


--000000000000e700140602ef0359
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIQbQYJKoZIhvcNAQcCoIIQXjCCEFoCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg3EMIIFDTCCA/WgAwIBAgIQeEqpED+lv77edQixNJMdADANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA5MTYwMDAwMDBaFw0yODA5MTYwMDAwMDBaMFsxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBS
MyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
vbCmXCcsbZ/a0fRIQMBxp4gJnnyeneFYpEtNydrZZ+GeKSMdHiDgXD1UnRSIudKo+moQ6YlCOu4t
rVWO/EiXfYnK7zeop26ry1RpKtogB7/O115zultAz64ydQYLe+a1e/czkALg3sgTcOOcFZTXk38e
aqsXsipoX1vsNurqPtnC27TWsA7pk4uKXscFjkeUE8JZu9BDKaswZygxBOPBQBwrA5+20Wxlk6k1
e6EKaaNaNZUy30q3ArEf30ZDpXyfCtiXnupjSK8WU2cK4qsEtj09JS4+mhi0CTCrCnXAzum3tgcH
cHRg0prcSzzEUDQWoFxyuqwiwhHu3sPQNmFOMwIDAQABo4IB2jCCAdYwDgYDVR0PAQH/BAQDAgGG
MGAGA1UdJQRZMFcGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYBBAGCNxQCAgYKKwYBBAGCNwoDBAYJ
KwYBBAGCNxUGBgorBgEEAYI3CgMMBggrBgEFBQcDBwYIKwYBBQUHAxEwEgYDVR0TAQH/BAgwBgEB
/wIBADAdBgNVHQ4EFgQUljPR5lgXWzR1ioFWZNW+SN6hj88wHwYDVR0jBBgwFoAUj/BLf6guRSSu
TVD6Y5qL3uLdG7wwegYIKwYBBQUHAQEEbjBsMC0GCCsGAQUFBzABhiFodHRwOi8vb2NzcC5nbG9i
YWxzaWduLmNvbS9yb290cjMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjMuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yMy5jcmwwWgYDVR0gBFMwUTALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgEo
CjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAN
BgkqhkiG9w0BAQsFAAOCAQEAdAXk/XCnDeAOd9nNEUvWPxblOQ/5o/q6OIeTYvoEvUUi2qHUOtbf
jBGdTptFsXXe4RgjVF9b6DuizgYfy+cILmvi5hfk3Iq8MAZsgtW+A/otQsJvK2wRatLE61RbzkX8
9/OXEZ1zT7t/q2RiJqzpvV8NChxIj+P7WTtepPm9AIj0Keue+gS2qvzAZAY34ZZeRHgA7g5O4TPJ
/oTd+4rgiU++wLDlcZYd/slFkaT3xg4qWDepEMjT4T1qFOQIL+ijUArYS4owpPg9NISTKa1qqKWJ
jFoyms0d0GwOniIIbBvhI2MJ7BSY9MYtWVT5jJO3tsVHwj4cp92CSFuGwunFMzCCA18wggJHoAMC
AQICCwQAAAAAASFYUwiiMA0GCSqGSIb3DQEBCwUAMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9v
dCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTA5
MDMxODEwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEgMB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENB
IC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2JhbFNpZ24wggEiMA0GCSqG
SIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMJXaQeQZ4Ihb1wIO2hMoonv0FdhHFrYhy/EYCQ8eyip0E
XyTLLkvhYIJG4VKrDIFHcGzdZNHr9SyjD4I9DCuul9e2FIYQebs7E4B3jAjhSdJqYi8fXvqWaN+J
J5U4nwbXPsnLJlkNc96wyOkmDoMVxu9bi9IEYMpJpij2aTv2y8gokeWdimFXN6x0FNx04Druci8u
nPvQu7/1PQDhBjPogiuuU6Y6FnOM3UEOIDrAtKeh6bJPkC4yYOlXy7kEkmho5TgmYHWyn3f/kRTv
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBUwwggQ0oAMCAQICDF5AaMOe0cZvaJpCQjANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMjA5MTAwODIxMzhaFw0yNTA5MTAwODIxMzhaMIGO
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xFTATBgNVBAMTDE1pY2hhZWwgQ2hhbjEoMCYGCSqGSIb3DQEJ
ARYZbWljaGFlbC5jaGFuQGJyb2FkY29tLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
ggEBALhEmG7egFWvPKcrDxuNhNcn2oHauIHc8AzGhPyJxU4S6ZUjHM/psoNo5XxlMSRpYE7g7vLx
J4NBefU36XTEWVzbEkAuOSuJTuJkm98JE3+wjeO+aQTbNF3mG2iAe0AZbAWyqFxZulWitE8U2tIC
9mttDjSN/wbltcwuti7P57RuR+WyZstDlPJqUMm1rJTbgDqkF2pnvufc4US2iexnfjGopunLvioc
OnaLEot1MoQO7BIe5S9H4AcCEXXcrJJiAtMCl47ARpyHmvQFQFFTrHgUYEd9V+9bOzY7MBIGSV1N
/JfsT1sZw6HT0lJkSQefhPGpBniAob62DJP3qr11tu8CAwEAAaOCAdowggHWMA4GA1UdDwEB/wQE
AwIFoDCBowYIKwYBBQUHAQEEgZYwgZMwTgYIKwYBBQUHMAKGQmh0dHA6Ly9zZWN1cmUuZ2xvYmFs
c2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNydDBBBggrBgEFBQcw
AYY1aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAw
TQYDVR0gBEYwRDBCBgorBgEEAaAyASgKMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2Jh
bHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwSQYDVR0fBEIwQDA+oDygOoY4aHR0cDov
L2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcmwwJAYDVR0R
BB0wG4EZbWljaGFlbC5jaGFuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQU31rAyTdZweIF0tJTFYwfOv2w
L4QwDQYJKoZIhvcNAQELBQADggEBACcuyaGmk0NSZ7Kio7O7WSZ0j0f9xXcBnLbJvQXFYM7JI5uS
kw5ozATEN5gfmNIe0AHzqwoYjAf3x8Dv2w7HgyrxWdpjTKQFv5jojxa3A5LVuM8mhPGZfR/L5jSk
5xc3llsKqrWI4ov4JyW79p0E99gfPA6Waixoavxvv1CZBQ4Stu7N660kTu9sJrACf20E+hdKLoiU
hd5wiQXo9B2ncm5P3jFLYLBmPltIn/uzdiYpFj+E9kS9XYDd+boBZhN1Vh0296zLQZobLfKFzClo
E6IFyTTANonrXvCRgodKS+QJEH8Syu2jSKe023aVemkuZjzvPK7o9iU7BKkPG2pzLPgxggJtMIIC
aQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQD
EyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgxeQGjDntHGb2iaQkIw
DQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIJDMSCfo3kE1awZivj64ucGun9i9ttPc
UxueKmntEmo2MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIzMDgx
NTA0NTcyNlowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCG
SAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQC
ATANBgkqhkiG9w0BAQEFAASCAQApDx27ejybyQol/NCQYH/vAhC1wCtBH4Hg0E1HJW230jTBgqWx
SzroRV+4h9x+N5x7Fi1aF1r7B2fM6BOQvPJy7juvvG8fsxPZmfFQQ+b07irDdOnrqVe0Tid6V3ok
os94xZx2IqWBn0BgWdmHQtKV7R4ueSzzoCdTOcK2YZ5+kIxpHF+FYjSzSUIx8XE6EPvjIPqxwcAN
AKquOJBWgD7EtwfGjouujDqGnQDon6SjfPnIgr/CeFW9weiok0JMCo8IwHh+YJbo8APvM9kEYVkZ
3eazFAJ+2k/d2Im6wP4SOPkBpyVm2pW7SH1vg2k5i59OIOWbRxooWRVaR6pCM5Iv
--000000000000e700140602ef0359--
