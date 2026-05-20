Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1A6372EFF
	for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 20:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779310015; cv=none; b=BvV05EzdZTHmrZZXchOevMfpTQY7zGzRXZV2ddG7k8OAqIs71k8X8HBOzyba06mYIt+fw6YPFQf2rp58zzNtnVNV1GBKl3IVQhbZgasZLJ1yms4p4h899/cF4Wg8pHDAsYH9KJGytAV+f/h2jzox7WPDTqidkeAr0cETbyE5mWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779310015; c=relaxed/simple;
	bh=Z5VgK4TfYvCC753qCsEXSy9TbUdGtsypGhKVOiRA9hU=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=trsfFCcvJGcJ6Z2vslwFFZoyocAfX8XvP2C35ZQdmHdyT5E91cDz8NmI+GtWODGX+d6BA9Ci38wt8wny3twsmidQDxCWqdplkBy/Fcel2AWe/m6ot0PZdKK+AhQz4s6nPm/ZUk+fSUrVHNfa4g8GtZ+JKoLEpliCb5984bcr3eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CvVFdlXw; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CvVFdlXw"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso50747665e9.1
        for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 13:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779310012; x=1779914812; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5VR6wSxGmgQGRO4B5HiOLZyz+Qvz6Sca486NUkPoFE=;
        b=CvVFdlXwPMjhughWg7wLvQhmSQwenIgV8OVe3nVjoKBUEt5qZ0cMzoyxGtf3kZmQv5
         IFWN4zw1tIuz6ekBvCVOlGjHitQTPlYq0zfm+rDbbBun1eG2fWKBTnnB0ptSTgWKrEzn
         OyvYhR7MzalL3EgsPNfXFy1aL4ZOOXEYfEPvMGNG7hJYgT0wVu8yLT7PVH0uQr7/E1KV
         QRlb2G1aA7BmRD1iapQgUftZkamD6wL0aFZcUbAQS8KSZgNt2+4WAuvuqRM1AOVnT8VZ
         tCizmVsSVhz5A8oyESQsG/7klE7qgV7pbHYpcdDGbXqiVXXgDvFDzXYwblc/HGCSHPN3
         7gRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779310012; x=1779914812;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i5VR6wSxGmgQGRO4B5HiOLZyz+Qvz6Sca486NUkPoFE=;
        b=jIV6rs0hLPrkj7elVyiHcYE2Mdo5i9JUhBD+kR2szk+b3vVGeWj0VAwNHeq928j6g7
         JAJqGfQpA4OsVTR/DdjGrHfDLC40G8eM7hGO9GvJ8Sm3+OjmNmADHx5k5b8MLHyZbeG2
         rG0Ui1rsffiMyRpkb9B1vMRzhTIG8aB6xrmjzbZKSd7g7V/u8IzW0aG7XT91DEt00IBQ
         zB9RWMifdZvFfzMKhuBhJfPkFlnM5yMOcR9ah0ck5j+SZcgovR5u1UeZgG5ZSh+OCM4s
         VWoxM8S1ga+6E4RiNxEjSHw6m7R8rIVf61iCwzqScjYVcPpjJgwhkpGyDNy91pEZRQma
         grCA==
X-Gm-Message-State: AOJu0Yyu7GC+HMgDNhy342s4CzFUWH99gIrYSDe+/pLKxgk9fQzw01OJ
	9JQGif+CSzqJQ8Pj+3v1Y/ItCTyfsbABZp7Qozr9NraWWBRewGy3M7JW
X-Gm-Gg: Acq92OE9EMNw2DXkJUrpW0B3S1pRmTHWke6p/340wKQ7VBpdiNuIx6c0Y1GeYcwuHUk
	+YVRdXJclsQfmtY/5ButChMljZjVQa/q/t7dRlmdqDejWKNnj0zk5MX+aQlJ18193+7BLuaw1iH
	5eVGkhOFOSTrC7L5l22IAkEt6/2X3eyl10zimyMmiT7EwMy3MY7Q0MKZTOv0e5rJXJ+AH7JAIyp
	DluVK6LH/C7RuKhK0QT5KYekkJrUUUtITAyeBYBLuKV8vdyj38PgRzSX436mximn7dgiGYtMmy/
	+D1N4jgCMEPKgWXaLye7+IGrdOdKRtXyqkTxjoVemxlQ8bB8BExQF9RdVtYo9LmILgiZFXGZkxo
	HUBVj3Y7Watw9UTfXPyP74FaHyjI/E+cI61/CWGwq14nPXFhCQrIJrTpNjEZx5xWkoGY9aaCZkW
	d1cW8IJvON7KcJuafI13Z+9vbUGfdwKqd9f4FX/4LQCNj5jZKXbrNSlZpZvAAG
X-Received: by 2002:a05:600c:34d5:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-49035f6762bmr531805e9.12.1779310011590;
        Wed, 20 May 2026 13:46:51 -0700 (PDT)
Received: from [192.168.0.2] (p5de56645.dip0.t-ipconnect.de. [93.229.102.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d44705sm14758295e9.4.2026.05.20.13.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 13:46:51 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------t3O1XtFmplW2EzpOz37QZuZG"
Message-ID: <ef137927-4626-44ec-9726-019be9347d2c@gmail.com>
Date: Wed, 20 May 2026 22:46:50 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: nct6683 Add support for ASRock Z890 Pro-A
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <4eee938d-e4ca-427d-a161-aa9ef737af3c@gmail.com>
 <7ec1cd4a-c094-42a2-ba60-e6cc7d82e7e2@roeck-us.net>
Content-Language: en-US
From: =?UTF-8?Q?Reiner_Pr=C3=B6ls?= <reiner.proels@gmail.com>
In-Reply-To: <7ec1cd4a-c094-42a2-ba60-e6cc7d82e7e2@roeck-us.net>

This is a multi-part message in MIME format.
--------------t3O1XtFmplW2EzpOz37QZuZG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Here the patch as attatchment


Am 20.05.26 um 21:54 schrieb Guenter Roeck:
> On Wed, May 20, 2026 at 09:16:37PM +0200, Reiner Pröls wrote:
>>  From ac010d19f5ba1e44a0ddb83cc570f18ca3348015 Mon Sep 17 00:00:00 2001
>> From: =?UTF-8?q?Reiner=20Pr=C3=B6ls?= <Reiner.Pröls@gmail.com>
>> Date: Wed, 20 May 2026 20:59:57 +0200
>> Subject: [PATCH] Add support for ASRock Z890 Pro-A mainboard
> Subject should be
> 	"hwmon: (nct6683) Add support for ASRock Z890 Pro-A"
> or similar. Actually, your outer subject comes close.
>
>> MIME-Version: 1.0
>> Content-Type: text/plain; charset=UTF-8
>> Content-Transfer-Encoding: 8bit
>>
> Description goes here. Look into the driver log for examples.
>
> Also, it looks like you embedded your patch in another patch
> with a different subject. That probably triggers:
>
> WARNING: From:/Signed-off-by: email address mismatch: 'From: "Reiner Pröls" <Reiner.PrÃ¶ls@gmail.com>' != 'Signed-off-by: Reiner Pröls <Reiner.Pröls@gmail.com>'
>
> Also, when I try to apply the patch, I get "patch is empty".
>
> Please fix this up.
>
>> Signed-off-by: Reiner Pröls <Reiner.Pröls@gmail.com>
>> ---
>>   drivers/hwmon/nct6683.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
>> index 0581770380cc..1b9092f48c7d 100644
>> --- a/drivers/hwmon/nct6683.c
>> +++ b/drivers/hwmon/nct6683.c
>> @@ -177,12 +177,13 @@ superio_exit(int ioreg)
>>   #define NCT6683_CUSTOMER_ID_MSI3    0x207
>>   #define NCT6683_CUSTOMER_ID_MSI4    0x20d
>>   #define NCT6683_CUSTOMER_ID_AMD        0x162b
>> -#define NCT6683_CUSTOMER_ID_ASROCK        0xe2c
>> +#define NCT6683_CUSTOMER_ID_ASROCK    0xe2c
>>   #define NCT6683_CUSTOMER_ID_ASROCK2    0xe1b
>>   #define NCT6683_CUSTOMER_ID_ASROCK3    0x1631
>>   #define NCT6683_CUSTOMER_ID_ASROCK4    0x163e
>>   #define NCT6683_CUSTOMER_ID_ASROCK5    0x1621
>>   #define NCT6683_CUSTOMER_ID_ASROCK6    0x1633
>> +#define NCT6683_CUSTOMER_ID_ASROCK7    0x163d // Z890 Pro-A
> No C++ comments in this file, please.
>
>>   #define NCT6683_REG_BUILD_YEAR        0x604
>>   #define NCT6683_REG_BUILD_MONTH        0x605
>> @@ -1248,6 +1249,8 @@ static int nct6683_probe(struct platform_device *pdev)
>>           break;
>>       case NCT6683_CUSTOMER_ID_ASROCK6:
>>           break;
>> +    case NCT6683_CUSTOMER_ID_ASROCK7:
>> +        break;
> Was this cut-and-paste ? There are no tabs, just spaces, meaning the
> patch would not apply. That would also explain the duplicated headers.
>
> Guenter
>
>>       default:
>>           if (!force)
>>               return -ENODEV;
>> -- 
>> 2.43.0
>>
>>

--------------t3O1XtFmplW2EzpOz37QZuZG
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-hwmon-Added-support-for-ASRock-Z890-Pro-A.patch"
Content-Disposition: attachment;
 filename="0001-hwmon-Added-support-for-ASRock-Z890-Pro-A.patch"
Content-Transfer-Encoding: base64

RnJvbSA2ZDg4ZjAyZTc3MGZkMTk2NWExNGY5NzVjM2ExNzNmZWVlZDllMWFjIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/UmVpbmVyPTIwUHI9QzM9QjZscz89
IDxSZWluZXIuUHLDtmxzQGdtYWlsLmNvbT4KRGF0ZTogV2VkLCAyMCBNYXkgMjAyNiAyMjo0
NDo0NSArMDIwMApTdWJqZWN0OiBbUEFUQ0hdIGh3bW9uOiBBZGRlZCBzdXBwb3J0IGZvciBB
U1JvY2sgWjg5MCBQcm8tQQpNSU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5cGU6IHRleHQv
cGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAoK
U2lnbmVkLW9mZi1ieTogUmVpbmVyIFByw7ZscyA8UmVpbmVyLlByw7Zsc0BnbWFpbC5jb20+
Ci0tLQogZHJpdmVycy9od21vbi9uY3Q2NjgzLmMgfCA1ICsrKystCiAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9od21vbi9uY3Q2NjgzLmMgYi9kcml2ZXJzL2h3bW9uL25jdDY2ODMuYwppbmRleCAwNTgx
NzcwMzgwY2MuLjM3NDA1MzI5YmE3OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9od21vbi9uY3Q2
NjgzLmMKKysrIGIvZHJpdmVycy9od21vbi9uY3Q2NjgzLmMKQEAgLTE3NywxMiArMTc3LDEz
IEBAIHN1cGVyaW9fZXhpdChpbnQgaW9yZWcpCiAjZGVmaW5lIE5DVDY2ODNfQ1VTVE9NRVJf
SURfTVNJMwkweDIwNwogI2RlZmluZSBOQ1Q2NjgzX0NVU1RPTUVSX0lEX01TSTQJMHgyMGQK
ICNkZWZpbmUgTkNUNjY4M19DVVNUT01FUl9JRF9BTUQJCTB4MTYyYgotI2RlZmluZSBOQ1Q2
NjgzX0NVU1RPTUVSX0lEX0FTUk9DSwkJMHhlMmMKKyNkZWZpbmUgTkNUNjY4M19DVVNUT01F
Ul9JRF9BU1JPQ0sJMHhlMmMKICNkZWZpbmUgTkNUNjY4M19DVVNUT01FUl9JRF9BU1JPQ0sy
CTB4ZTFiCiAjZGVmaW5lIE5DVDY2ODNfQ1VTVE9NRVJfSURfQVNST0NLMwkweDE2MzEKICNk
ZWZpbmUgTkNUNjY4M19DVVNUT01FUl9JRF9BU1JPQ0s0CTB4MTYzZQogI2RlZmluZSBOQ1Q2
NjgzX0NVU1RPTUVSX0lEX0FTUk9DSzUJMHgxNjIxCiAjZGVmaW5lIE5DVDY2ODNfQ1VTVE9N
RVJfSURfQVNST0NLNgkweDE2MzMKKyNkZWZpbmUgTkNUNjY4M19DVVNUT01FUl9JRF9BU1JP
Q0s3CTB4MTYzZCAKIAogI2RlZmluZSBOQ1Q2NjgzX1JFR19CVUlMRF9ZRUFSCQkweDYwNAog
I2RlZmluZSBOQ1Q2NjgzX1JFR19CVUlMRF9NT05USAkJMHg2MDUKQEAgLTEyNDgsNiArMTI0
OSw4IEBAIHN0YXRpYyBpbnQgbmN0NjY4M19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQogCQlicmVhazsKIAljYXNlIE5DVDY2ODNfQ1VTVE9NRVJfSURfQVNST0NLNjoK
IAkJYnJlYWs7CisJY2FzZSBOQ1Q2NjgzX0NVU1RPTUVSX0lEX0FTUk9DSzc6CisJCWJyZWFr
OwogCWRlZmF1bHQ6CiAJCWlmICghZm9yY2UpCiAJCQlyZXR1cm4gLUVOT0RFVjsKLS0gCjIu
NDMuMAoK

--------------t3O1XtFmplW2EzpOz37QZuZG--
