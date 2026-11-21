Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795300558;
	b=ymKaqxAkpVNoI7J2kgHbPYcCcT78Zvu9vPAURPx8k7KvXBePY9RHC3JhiABffP/00HM2
	 cH5MWPaYI4/gBw9cE2EMgvdM83UQnodHeMlFOcWaObhhTQOjCca6DHyOyEZCsb0tfxzhB
	 9M71uy5TSrTf6Y+nVCeG94/1tF9CZh/Yg1zrEzdxTWwOo7KvoxtOSbuWDKtAIPd4cl2Bs
	 syIXHxXkD9nKn3TzUSjl3uoNFIVEjDj1XhJBPKsDp+hoWxuWXCBuham2gTjjs7Xa2IoV8
	 umEQISSCH6564IjsoOaf7tDswwgu4rOt7J2Q/9saHZxU+lmTNiiH8SDGdR6Uvce0QiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795300558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:To:
	 Content-Language:Cc:Subject:Content-Type:Content-Transfer-Encoding;
	bh=8BfPm4vgIMDzSC5DDmb35L2urYjzFiMnhfe+cNvlHkk=;
	b=KtJ4L/qRraHjNxN0Hnw/5fKSK7463XpMQMJvOgx3DFaQQ2JtAktMDGZyTBcluN8Zj2M5
	 zTAUk5OX2Ei444E2cqG0/WJQf766SfP5H7+K7t0hSBkB27BwVsQ0s9vxqotELuxH8jWYs
	 QBRpT6iZX9fZW0hkwgU/8RkfF/+jQiYKwN0TxDxAnvld0jBUvNIZ7T/yP5b4kEW4a81nJ
	 yNF/DIFJWOPDToZLs0rDdcJLRYI5ZFZ40BAu9zYcQQkY924d9dzGIg8yTOXei8uHZaNpj
	 lk4KhET0vn4ny79mA81pBFh3Jf9xtQ/eghpuqj7Rbfoki8zfxCAFHwpPG8yWca8ibNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=l1slPY8f;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3C4606A320
	for <linux-hwmon@vger.kernel.org>; Sat, 21 Nov 2026 22:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F3C4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=l1slPY8f
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso1139464f8f.1
        for <linux-hwmon@vger.kernel.org>; Sat, 21 Nov 2026 14:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795300556; x=1795905356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:cc:content-language
         :to:user-agent:mime-version:date:message-id:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8BfPm4vgIMDzSC5DDmb35L2urYjzFiMnhfe+cNvlHkk=;
        b=l1slPY8fLhyVwwPT1VGYSCmXN71AeBK0C2uRXeCHyG7DM89Fhy47wxAJj1rdk0KeJl
         JduLjS9Ft48oKNig0voJ7petoXP/FSGlqdCl+lUwsBmOQiH8yQ6/753ji/muzif9zQ6T
         +6xtlcGdXTs1OQh/R5KbPqV6jzg4HaRLXSnA0629VRk8oIu/dy0nsaeT5X6a+hT1zV+8
         hhmdzh4Om606P73b+5CqeHSzvQLw7wOCkPU4DaqruBOgt7w/7MhQ8aWjuEgVmpdWByq6
         GPkZAhksoee2Id+X+lJLvVZF1g5mC9fqyx6vnqABMgZh3xlLzhjCC6cdB68Q8hYhOsEI
         Lvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795300556; x=1795905356;
        h=content-transfer-encoding:content-type:subject:cc:content-language
         :to:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8BfPm4vgIMDzSC5DDmb35L2urYjzFiMnhfe+cNvlHkk=;
        b=cRf4lG4SF2Qg0i0tRXfmw7tZWepJKkDdy5HdSUPEFknfqChh6P/5VXDRJRZPf+G3gj
         /GjwvyNoGKbqWbR4ZOTV9LDOGamr4IZ3r/Z372xXgl9o+NUY4Euik4+FseI0lOOhlz0u
         v//ynBH7o5O3fhBoRfZbD2TXlpb3/TM6AAL2yrl6WursYN80fBSqgS6/0mbmoWELTeER
         5GOvWOYtx3AZKLSb92NE3WGvY+ILEvRrlkuazOuEgBTOEYp+jj7MC32KMCkK3tGbZjJn
         sZGloB+PRomhQ9jKD38+yOt5uh2BLf2iEqro5YHO9uvoGAGJaHm05JPncEOHQRMtM0kZ
         eyjg==
X-Gm-Message-State: APuU4Z/nmDWXZvGdyDimzt89MKME/Y7t1eYmdOJpjY5DZ6bYApgiNer5
	Z/ro5PK9Snxury0wct3goVHeNSc/2qQx9jGHTVKDJahLRZ52tcXhDvzBUWVER9SP
X-Gm-Gg: AZFdTZdojvkFtRXCzOEaJ9yTqUjxK65awchjh/22t6s/ZnGJWDiqid4gfiuQMOaDiEQ
	6A7+RjxLPbZdDRP9zP3Rb2LlsmKGql2/2X9bGyM9VOzNcChY72gpUUoNRvgFsmeMtR02ohHSXt2
	jJ/lT2kYfzdRe6bAgHfuRO46Z0Fte3U5UG4ieExSWR+QgrUGW3bsCjY3HJ6UW71/XLc3spnnt4x
	coxKHA6Gwuabhk3pqpsVGpoPEvflXWHZ5+mPo5WqUd6+q8kjHZGl0Yfcz0yNE0AYkLexBBdaLbp
	8ZlXi2PdWLwOvRwgVvkOcJr9AXFVaUvmQhA9+mIeG0m6x/ALLbhreh5tVqXTPIIjCwRq7kWebLJ
	XsggtldIigQiF2zfcIGse20C3gJB+WMTkRVcpw8JpJqJnXf+KDTm6I25nLgNGXqJQxO9NzkNYTd
	jd+4CXDtd7z3tliTf0KZyAiCOqWqo5phrbb4PQ6GD4CxwI63EhAZQyQFqHJub8spMyQAPARlPBY
	B4/PJC7Yj8fiHmx14LI+uEwJEjrs1ZSARO1iwf2udvMP4ICU043caXoodlN7PuorUpNNg9N9hKu
	/F3eZKig2Kx2EFKIj14s0ZRwPhZXkZnffeKJ8a5xsP7rtZ062rEYpF3/Y4/E/ojkc0kB1b8ONA=
	=
X-Received: by 2002:a05:6000:41c9:b0:48d:fdd0:6ce8 with SMTP id ffacd0b85a97d-4abaab633bcmr14379258f8f.3.1795300556246;
        Sat, 21 Nov 2026 14:35:56 -0800 (PST)
Received: from ?IPV6:2001:9e8:3c12:9800:515:a1a4:15ac:9f86? ([2001:9e8:3c12:9800:515:a1a4:15ac:9f86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm13880679f8f.52.2026.11.21.14.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 14:35:55 -0800 (PST)
From: Spoon3er <spoon3r73@googlemail.com>
X-Google-Original-From: Spoon3er <spoon3r73@gmail.com>
Message-ID: <3b6ce200-ae89-4629-a05b-bcdc503871d3@gmail.com>
Date: Sat, 21 Nov 2026 23:35:55 +0100
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-hwmon@vger.kernel.org
Content-Language: en-US
Cc: Guenter Roeck <linux@roeck-us.net>, Aleksa Savic <savicaleksa83@gmail.com>
Subject: hwmon: (aquacomputer_d5next) Aquaero 5 no longer probes after
 b7743c6dbe3a
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

commit b7743c6dbe3a ("hwmon: (aquacomputer_d5next) Check maxcollection when
probing AQUAERO devices") breaks Aquaero support here: aqc_probe() returns
-ENODEV, no hwmon device is registered, and the HID interface is left 
without
a driver.

Hardware: Aquacomputer Aquaero 5, USB 0c70:f001, bcdDevice 0.02.
Kernels: 7.3.5-2-cachyos (carries the patch).

Aquaero exposes three HID interfaces under the same VID/PID. Values observed
in aqc_probe() after hid_parse():

   keyboard/mouse        3             0x00010006               1
   System Control           2             0x000c0001 1
   aquaero Device           1             0xff000001          (not parsed)

The "aquaero Device" interface - the one the driver has to bind to - only
presents a single vendor-defined top-level collection. The new
"hdev->maxcollection < 2" test therefore rejects it before the
collection[1].type check is reached. kretprobe on aqc_probe() confirms the
return value is -ENODEV.

Before the commit the check was only "hdev->collection[1].type != 0", which
happened to work: the collection array is allocated with collection_size ==
16 and zero-filled, so collection[1].type reads as 0 for the device.

Proposed fix - bounds-guard the read instead of requiring a second 
collection:

--- a/drivers/hwmon/aquacomputer_d5next.c
+++ b/drivers/hwmon/aquacomputer_d5next.c
@@ -2983,7 +2983,7 @@ static int aqc_probe(struct hid_device *hdev, 
const struct hid_device_id *id)
           * their respective collections set to 1, while the real 
device has it set to 0.
           */
-        if (hdev->maxcollection < 2 || hdev->collection[1].type != 0) {
+        if (hdev->maxcollection > 1 && hdev->collection[1].type != 0) {
              ret = -ENODEV;
              goto fail_and_close;
          }

I verified it on 7.3.5 and 6.18.64: the driver binds, hwmon "aquaero"
appears and flow/fan/temperature readings are correct.

Happy to test a formal patch if you prefer.

Thanks,
Nandor Lieszkovszky

