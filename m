Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3901C84A5B
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Sep 2024 06:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725432695; cv=none; b=nU1BHIT6+0J7f4i53s412g3t6VVwCkk0xqclmxHby8BPhH4yudYeLZq22hpPGJ6BIcBp8MU8IJdf3YY+5gOC7mV3dALLhVnUXC21G4McUMff/x5RzNpN90aw1pC8Nvgyo7XKDbYxpvqIwEblZpaRuM1RpnOtuQ82GaGvLwZ/j1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725432695; c=relaxed/simple;
	bh=G0ym2kymBMRas8WKBAZwDBCnwmeK2nlICokTaGyK4U8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=jXyZUZfh6UqSXvSGiG1N4CpB9GOCNj5WhU1bQHDnAvQJaWuRoudLD9l3HNh6zSkNU3FoQAmRLw1++TAVOtvWU/1OuyP4BpmjOdaOZRhfFqDDnnR31zlmyagr/G1jm2sD2mZix1cmc9rRb+tHwDUxdtyfptUfp4wm4d7ezQ0ouKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ktluayu6; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ktluayu6"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3df0dc53ec1so3677543b6e.1
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Sep 2024 23:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725432693; x=1726037493; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SPyZ+X2qfAr8o/GaTwhf850iGwiAwG46XAGD3xTUuYw=;
        b=Ktluayu6E+3Q9TLMK6dWI3eMdZjnStqdRpAg+ubeRRYzRE6tovXaea/WwkwfwiltOE
         SzmBW5EjFSLk5NvBHudMBBGAjZC/WYjGbO2Nmi/sYS7Vxe2fR0Ws0B4E37vuy8jrLeD/
         /5Pd0I/GuF3ZCWvVPj9Zz3wQ1/WZ+s+y/kVJYETtp6hx1Mt0aV2IvZ21VfDoELN2njv0
         AkG1ZA8KSdGEZB/pgZdMKxpn8OqxVty5nM+i8CqF/pj1nFHRcysWKY3HxfwhCae9yqBt
         Ea+qprlvlkk2DlRpahBNvgLqYWLkOZ9H95fuu6DmdAFY4FCLDIDH81slEIsX6U0ryjuR
         dn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725432693; x=1726037493;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SPyZ+X2qfAr8o/GaTwhf850iGwiAwG46XAGD3xTUuYw=;
        b=GihcYkGIcazVZdqF3yIGgpDM7ZMajGTzTODWoYhhoro/H/EQFL6jfkBHTqIrBDOdHk
         +gfdfUblBXDY5aUWzgu/OdcgIWHEWvm+Sf2N8DNBiNFdTulqfhRBtaS/aAFCaBkHbxnw
         yT09gm7G2owbL0MFD0S7MKrb74p4jnKUaLyFgot7H1jjSEjDUUSnh0wbg8YA1L+Av8CN
         p72/cqm2LiWxd4QgtLpqupkDS7jKEfQhy9cUSsxssR2vRVYoAwbpFy4Jipb819/RrT01
         p+tLFV+oWdPrVEwgHP9JxLs0B8oFDIQzYNveZyhSnVPUOu5akcwTVcSRNyqcTJoLUWnF
         b3bw==
X-Forwarded-Encrypted: i=1; AJvYcCVvK16iKw53bvvzZU/v3nGk1XaFLAtMI2EMmbaatS6YuQH10HlzOsj9FDbvPrmT1NgNS3OmzsmuADhTHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjKiIQK+NRA+41yplnjpnvTLGjEktEwLvPttvDumzG61j+V4+O
	wesP3YGvLsZFCTq+CW+m93IGTTJikpASDiV3TNmFHFFpBLatvyrwDzA7E5kKeGhhk26Npf5oIqc
	vDTWvids+0YQOvwS270xJLHyNyAsWHcwv
X-Google-Smtp-Source: AGHT+IEmFsi9TW4R7/86rtURQk6E87hEtQ1ItbZs2eNA+PyPVmzTZqBuIv4qPCuvJvD6PL6OYt62erNvFBrY4ZTyaJ4=
X-Received: by 2002:a05:6871:4102:b0:25e:bd9d:b1cb with SMTP id
 586e51a60fabf-277d05f9b61mr14856183fac.40.1725432692948; Tue, 03 Sep 2024
 23:51:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Patryk <pbiel7@gmail.com>
Date: Wed, 4 Sep 2024 08:51:21 +0200
Message-ID: <CA+DkFDb--ow-Nc35bDh2Nmrf23B2wsrWW82uAQmu9U3_O4r0XQ@mail.gmail.com>
Subject: Question regarding write-back operation to STATUS register
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi
I'm trying to bring-up LTC2977 and LTC2974  devices (I used DC1962CF
demonstration system, it hosts both devices) on our board (NXP
Layerscape basd) using an existing driver, namely LTC2978 ( and I
faced some minor problems which I would like to clarify.
The driver probed successfully for both devices, and various sysfs
attributes have been created under */hwmonX/, however I would like to
focus only on few of them, namely:
- temp1_input: current temperature
- temp1_max: max allowed temperature, any temp value above this
setting will trigger a warning
- temp1_max_alarm: boolean value indicating whether or not alarm
conditions have occurred

I wanted to test if everything works fine so I conducted the following
test assuming that the temp1_input in my testing environment usually
shows value around 38000:
- I read the temp1_max_alarm using: cat temp1_max_alarm -> it showed "0"
- I set temp1_max to 20000
- I read the temp1_max_alarm using: cat temp1_max_alarm -> it returned
"cat: read error: No such device or address"
It occurred only on LTC2977, never happend on LTC2974.
I traced down what exactly happens when I issue this command and it
seems that the target device, LTC2977 responds with NACK to one of the
issued commands. But what is this command exactly?
When one reads temp1_max_alarm the driver (pmbus_core in this case)
does the following:
- the driver reads STATUS_TEMPERATURE and if 6th bit in this register
(Status_temperature_ot_warn) is set it continues with further commands
- the driver reads READ_TEMPERATURE_1
- the driver reads OT_WARN_LIMIT
- the driver updates the status register (STATUS_TEMPERATURE) with the
same value that it previously read *(see_below)
- the driver compares OT_WARN_LIMIT and READ_TEMPERATURE_1 and then it
returns appropriate value (0 or 1 ) to userspace

* this was added in 35f165f08950a876f1b95a61d79c93678fba2fd6 commit,
and it seems to be compliant with PMBUS specification that says (PMBus
Specification rev.1.3.1 part II, chapter 10.2.4):
"Any or all of the bits in any status register except STATUS_BYTE and
STATUS_WORD can be directly cleared by issuing the status command with one data
byte that is written. The data byte is a binary value. A 1 in any bit
position indicates
that bit is to be cleared, if set, and unchanged if not set"
Below is the simplified sequence of operations that are performed
while reading temp1_max_alarm:
- smbus_read: i2c-7 a=033 f=0004 c=7d BYTE_DATA /* read
STATUS_TEMPERATURE, returns 0x40 */
- smbus_read: i2c-7 a=033 f=0004 c=8d WORD_DATA /* read READ_TEMPERATURE_1 */
- smbus_read: i2c-7 a=033 f=0004 c=51 WORD_DATA /* OT_WARN_LIMIT */
- smbus_write: i2c-7 a=033 f=0004 c=7d BYTE_DATA l=1 [40] /* write
back status register to clear warn bit */

The last operation fails due to NACK received.
So I'm wondering - considering that this "write back" operation takes
place in the correct place, in the correct order and so on according
to PMBUS specification, could it be that the device itself does not
implement this correctly and simply responds with NACK to the write
back operation to status register?
On the other hand - why does it work correctly on LTC2974 but would
not work on LTC2977?

I would be grateful for any insights or guidance on resolving this issue.

Best regards
Patryk
