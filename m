Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5172F26AED
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Sep 2024 14:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725461206; cv=none; b=ObWeC5GGrFFEG1toUjfmNgsYlBe2FYEeTxw9sB5U2IdqeQJjVGZhRQZa8jMjecNYeyocuuk8nqnaPpdzQW9vvY3+/qzP51bHXZX292tQC7+bAopae8eRfeXusNsyVAjTCerpoBUdsPLu062sJ/QGn8DcOTuWZpFlEA00A3M1+xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725461206; c=relaxed/simple;
	bh=wl38YQOz4hOtoIfXcKT54gOgqxQUiClUvW4hQfxdgPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tE4E3VVwYCXUGg8SSLZ6AtEcaZky+loAxkRV4QWgRsndhT36GK7UsRCNy/VTP73XisFlQs6fkdPZNdk36SMGSG5Vk8+ZWWXDrPFpfwoyrB/+KmOAXXA+96Zf+aAkwFcqfhN7qO4qb8cfGFpFq9BbsjbjVvtKL2An6K/INMxoLBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFyb/gZn; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFyb/gZn"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5dfabdbef52so4042023eaf.3
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Sep 2024 07:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725461204; x=1726066004; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/SNsnFyV3XEEt1VpvWnA6whoYAj3e1+zVaecECCl4lM=;
        b=KFyb/gZnLLZ/09UCUaKElULsJ+3Y/b0HhJFhy24zNlaruXEavIHFDhrmGAPWTeZ/SC
         3bA/fawx6/OOZbAXng9/l9nLw3Dz9dE3acP+dxSr15I2t0vs1qHul8XdoiUyQZ/bnDMT
         Y5hLC0J1fo58Q7bKWjpJ0g+djbdczCxq347ZENYyLeP65aqyps0npF6aXHGvut7SeCnX
         lkL3i4fYXIq+yH+XZax31T8BIvvVh8CeuqvImnDfMrwodPpPr/Ob7QRAs/CZK8mVsC9d
         /TUcArmWv4mtJ0oxvVnj4XLn95pbZft+68p5KzBiMNnzEdncPSKIuZaLvRHkxVaa7krW
         FKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725461204; x=1726066004;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SNsnFyV3XEEt1VpvWnA6whoYAj3e1+zVaecECCl4lM=;
        b=tHSOJodcxRwKiIA1i3PhLuxccvLssJv22gjaBReIJ/qF0q5rnHj3ncNQrUF023p4Nk
         6v5BjVBdKLMtHl3UzoPiOtsedJlptrC9NEO8IUt4nrVnkpgRVD+RB9VuQHAQ54/PUSMz
         ywqsBuo/yAcC2+tBnpX2KapTXwxYH2MbUEc4j+iZ3cGMt6y65AR9Xji+SnbYVbiNtiu8
         FAsAsN8c6SUzXt9UlQZeQwoRiww/BJC7+Fk+UnFPdSaXbWspjrzanNkGf3JSRTzA1p8I
         /WsrLiL1yUpb8ege+bLZfQ0hfMPM0zBSZhjzfWwUviwBpfc/dj1tNjr4NeCF1GpdIL7v
         a2fA==
X-Forwarded-Encrypted: i=1; AJvYcCUiqOguzKSkoqMQUtCTpZxffLsCoAmxHBCKu5eLWOQQQvjNBv+6WwXCR7INe4tWJpDrmfmnPgnMhOKqbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFfOHOfJ1uDp7GGGXkek7KYwCfwkJPTvq7sw3tIKGUCCa+Ktrn
	+dyq81iwcKMRq9xC4bwcjeAnHkj03nalUvbt3V32BpGQuH+zmnKU
X-Google-Smtp-Source: AGHT+IH42GZarfhM9xwPQTszYEKp9AXdllXE4POdFGH59LadFLnrGcAmx9Oo+8lhglOGSyk37Zx6zw==
X-Received: by 2002:a05:6870:9a1d:b0:261:16da:decb with SMTP id 586e51a60fabf-277ccb78ad3mr17001494fac.11.1725461204088;
        Wed, 04 Sep 2024 07:46:44 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbdade34sm1760137a12.77.2024.09.04.07.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 07:46:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <97098eef-880d-483c-a6c7-1aa0e46b7c42@roeck-us.net>
Date: Wed, 4 Sep 2024 07:46:42 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question regarding write-back operation to STATUS register
To: Patryk <pbiel7@gmail.com>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org
References: <CA+DkFDb--ow-Nc35bDh2Nmrf23B2wsrWW82uAQmu9U3_O4r0XQ@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CA+DkFDb--ow-Nc35bDh2Nmrf23B2wsrWW82uAQmu9U3_O4r0XQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/24 23:51, Patryk wrote:
> Hi
> I'm trying to bring-up LTC2977 and LTC2974  devices (I used DC1962CF
> demonstration system, it hosts both devices) on our board (NXP
> Layerscape basd) using an existing driver, namely LTC2978 ( and I
> faced some minor problems which I would like to clarify.
> The driver probed successfully for both devices, and various sysfs
> attributes have been created under */hwmonX/, however I would like to
> focus only on few of them, namely:
> - temp1_input: current temperature
> - temp1_max: max allowed temperature, any temp value above this
> setting will trigger a warning
> - temp1_max_alarm: boolean value indicating whether or not alarm
> conditions have occurred
> 
> I wanted to test if everything works fine so I conducted the following
> test assuming that the temp1_input in my testing environment usually
> shows value around 38000:
> - I read the temp1_max_alarm using: cat temp1_max_alarm -> it showed "0"
> - I set temp1_max to 20000
> - I read the temp1_max_alarm using: cat temp1_max_alarm -> it returned
> "cat: read error: No such device or address"
> It occurred only on LTC2977, never happend on LTC2974.
> I traced down what exactly happens when I issue this command and it
> seems that the target device, LTC2977 responds with NACK to one of the
> issued commands. But what is this command exactly?
> When one reads temp1_max_alarm the driver (pmbus_core in this case)
> does the following:
> - the driver reads STATUS_TEMPERATURE and if 6th bit in this register
> (Status_temperature_ot_warn) is set it continues with further commands
> - the driver reads READ_TEMPERATURE_1
> - the driver reads OT_WARN_LIMIT
> - the driver updates the status register (STATUS_TEMPERATURE) with the
> same value that it previously read *(see_below)
> - the driver compares OT_WARN_LIMIT and READ_TEMPERATURE_1 and then it
> returns appropriate value (0 or 1 ) to userspace
> 
> * this was added in 35f165f08950a876f1b95a61d79c93678fba2fd6 commit,
> and it seems to be compliant with PMBUS specification that says (PMBus
> Specification rev.1.3.1 part II, chapter 10.2.4):
> "Any or all of the bits in any status register except STATUS_BYTE and
> STATUS_WORD can be directly cleared by issuing the status command with one data
> byte that is written. The data byte is a binary value. A 1 in any bit
> position indicates
> that bit is to be cleared, if set, and unchanged if not set"
> Below is the simplified sequence of operations that are performed
> while reading temp1_max_alarm:
> - smbus_read: i2c-7 a=033 f=0004 c=7d BYTE_DATA /* read
> STATUS_TEMPERATURE, returns 0x40 */
> - smbus_read: i2c-7 a=033 f=0004 c=8d WORD_DATA /* read READ_TEMPERATURE_1 */
> - smbus_read: i2c-7 a=033 f=0004 c=51 WORD_DATA /* OT_WARN_LIMIT */
> - smbus_write: i2c-7 a=033 f=0004 c=7d BYTE_DATA l=1 [40] /* write
> back status register to clear warn bit */
> 
> The last operation fails due to NACK received.
> So I'm wondering - considering that this "write back" operation takes
> place in the correct place, in the correct order and so on according
> to PMBUS specification, could it be that the device itself does not
> implement this correctly and simply responds with NACK to the write
> back operation to status register?
> On the other hand - why does it work correctly on LTC2974 but would
> not work on LTC2977?
> 
> I would be grateful for any insights or guidance on resolving this issue.
> 

Datasheets will tell you: The status registers are supposed to be read-only
on those chips. We'll need to add some code to detect that condition and
refrain from clearing the status register if the chip doesn't support
writes (or maybe ignore errors from the clear operation). Ignoring the
error might be the easiest fix.

Note that the 2974 datasheet also states that the temperature register is
read-only, so the chip behavior does not seem to match reality.

Guenter

