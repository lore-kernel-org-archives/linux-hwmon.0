Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB401CF7AE
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Sep 2024 15:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725462023; cv=none; b=d2G1A9tsc7rU0LYlGq1xK/ShwFiWtiaidx80/QV0CFekWnXolzq+jwhWrmJswnD/oICqFhCIxwyH5CjORiPuF4KA9T8NpUUEFAtmA75PGK+PIenPSvwGTyLFns2iZaJ7hGkdZ8dWkRVNB0yD56Wmd5y2oB/QaUwRfgNG7JYPNb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725462023; c=relaxed/simple;
	bh=2aTt7vTB11pkgsXBrTemWenWc9KeYW+Szzn7cNRU2pQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S8hlsZSs+HqbnwvMBCo6wzKb1xkoCSZOSvipX6Esi97AN8uaHBSqgpxN/s9DXAS0PlE+aBrb7vDNMngz/kxx7ZMXlQyAIb5WMrPgOve5N6Bp0VKeoGwpKaAk55xCNP6GeTpG+CSw7rtEDB0cEoi+kndVy4C47bODhN0RXG95cFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EnNSnHf+; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EnNSnHf+"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71433096e89so5293365b3a.3
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Sep 2024 08:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725462021; x=1726066821; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfZwvAEZ1IEAlZ9IIgfEIY+CQ5WSGIvNwelrWd53/pM=;
        b=EnNSnHf+9ldKGSL8Pgrmg8APNUyu48HT2ejFQzqLhh1kl9szgkHJ9XLIXVZp5vblbo
         isPo4ZEBn+f0I4+4TDUyphmOufr3PTDVV6RYpIEo35AFqHAI1e9di03Ei3Iq9uV2ODkx
         ccV8B+brP9B+HldEDHDJ5kQhXJzoleQfdnYFTR+SxpjpMg3YDoy6elN1DQswPzbqZW7W
         Y2dT6FUnUS8sA7p+fO1xEG8RfUHkynE66YFlylhxPxs2zgqnE6OtSLjrH8ic6kxk6TI3
         PDCkYE6Bn7M0+rWgccrxisPEX+RDo//TSzAcok1BKhQZuU1KXc093ap7uDMDVQDQlDPX
         dLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725462021; x=1726066821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LfZwvAEZ1IEAlZ9IIgfEIY+CQ5WSGIvNwelrWd53/pM=;
        b=XVxkiMAHk1jk0QmTb34VOvDUj/cX0Jg0NmPJYKYX6QAxx/mxNZP3DdvyNe/3l3iaLH
         yc3jcr8p0U6CagI2+Fxg188PEkFEv16kAihSw+nRV3TxNZyi3JWKdrulu4dGD9RF/218
         wRwQkc0WGJu71V5A3uXZY6LfZz8fL3VjWgRTH7wiziDJdKAiMH+lcwM+yW0+dKcGAGiO
         NW+MQeEKUIKA0Wh+r5QwbEMzp8djqrgv+Xh8JMyG16O2QiJysFwq0ZB3FJMwJ+bCf6yZ
         22q724sDMJX1UPMpiwsKFpE3wks3i5OGhclz+CTYQn4TPLv3HJQobTCMPbXSjT+kOEHG
         WX6g==
X-Forwarded-Encrypted: i=1; AJvYcCUrJ+Teu1hJGQV4y9YjiZ80DLv7ZyHKuFwLHY/n42F6IoDsruNpWXJst2xgw7uRyOuAdIadeRF8J0Vk8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ+TLg3VW9IfvQiUeWBnIECpspVkZ/zhgfpBSzBBDQBustMqEr
	28AfuTOwsYlF8MgrZlys/G9HBVFhsDowRUToDN2rZb3iTnkrp1hF7lydRo1LeTSrtVe+c9YsHh7
	IleKQoL40bmWy8P4NnlsZfcFToo4=
X-Google-Smtp-Source: AGHT+IF2Be8ifhGmzc5ciDVDRaFE3D6gmt97txagAwpwW8kcUbxQHPXgNgX1zMUgo8FLa5DXQoxw2842SwexoTYzhoo=
X-Received: by 2002:a05:6a21:118a:b0:1cd:f065:4ef0 with SMTP id
 adf61e73a8af0-1cece5d139cmr14565521637.39.1725462020477; Wed, 04 Sep 2024
 08:00:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+DkFDb--ow-Nc35bDh2Nmrf23B2wsrWW82uAQmu9U3_O4r0XQ@mail.gmail.com>
 <97098eef-880d-483c-a6c7-1aa0e46b7c42@roeck-us.net>
In-Reply-To: <97098eef-880d-483c-a6c7-1aa0e46b7c42@roeck-us.net>
From: Patryk <pbiel7@gmail.com>
Date: Wed, 4 Sep 2024 17:00:08 +0200
Message-ID: <CA+DkFDaaqvBDdC-tikGotyKDx+KheRrhaCYatfpMdzReNsHyUQ@mail.gmail.com>
Subject: Re: Question regarding write-back operation to STATUS register
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C5=9Br., 4 wrz 2024 o 16:46 Guenter Roeck <linux@roeck-us.net> napisa=C5=
=82(a):
>
> On 9/3/24 23:51, Patryk wrote:
> > Hi
> > I'm trying to bring-up LTC2977 and LTC2974  devices (I used DC1962CF
> > demonstration system, it hosts both devices) on our board (NXP
> > Layerscape basd) using an existing driver, namely LTC2978 ( and I
> > faced some minor problems which I would like to clarify.
> > The driver probed successfully for both devices, and various sysfs
> > attributes have been created under */hwmonX/, however I would like to
> > focus only on few of them, namely:
> > - temp1_input: current temperature
> > - temp1_max: max allowed temperature, any temp value above this
> > setting will trigger a warning
> > - temp1_max_alarm: boolean value indicating whether or not alarm
> > conditions have occurred
> >
> > I wanted to test if everything works fine so I conducted the following
> > test assuming that the temp1_input in my testing environment usually
> > shows value around 38000:
> > - I read the temp1_max_alarm using: cat temp1_max_alarm -> it showed "0=
"
> > - I set temp1_max to 20000
> > - I read the temp1_max_alarm using: cat temp1_max_alarm -> it returned
> > "cat: read error: No such device or address"
> > It occurred only on LTC2977, never happend on LTC2974.
> > I traced down what exactly happens when I issue this command and it
> > seems that the target device, LTC2977 responds with NACK to one of the
> > issued commands. But what is this command exactly?
> > When one reads temp1_max_alarm the driver (pmbus_core in this case)
> > does the following:
> > - the driver reads STATUS_TEMPERATURE and if 6th bit in this register
> > (Status_temperature_ot_warn) is set it continues with further commands
> > - the driver reads READ_TEMPERATURE_1
> > - the driver reads OT_WARN_LIMIT
> > - the driver updates the status register (STATUS_TEMPERATURE) with the
> > same value that it previously read *(see_below)
> > - the driver compares OT_WARN_LIMIT and READ_TEMPERATURE_1 and then it
> > returns appropriate value (0 or 1 ) to userspace
> >
> > * this was added in 35f165f08950a876f1b95a61d79c93678fba2fd6 commit,
> > and it seems to be compliant with PMBUS specification that says (PMBus
> > Specification rev.1.3.1 part II, chapter 10.2.4):
> > "Any or all of the bits in any status register except STATUS_BYTE and
> > STATUS_WORD can be directly cleared by issuing the status command with =
one data
> > byte that is written. The data byte is a binary value. A 1 in any bit
> > position indicates
> > that bit is to be cleared, if set, and unchanged if not set"
> > Below is the simplified sequence of operations that are performed
> > while reading temp1_max_alarm:
> > - smbus_read: i2c-7 a=3D033 f=3D0004 c=3D7d BYTE_DATA /* read
> > STATUS_TEMPERATURE, returns 0x40 */
> > - smbus_read: i2c-7 a=3D033 f=3D0004 c=3D8d WORD_DATA /* read READ_TEMP=
ERATURE_1 */
> > - smbus_read: i2c-7 a=3D033 f=3D0004 c=3D51 WORD_DATA /* OT_WARN_LIMIT =
*/
> > - smbus_write: i2c-7 a=3D033 f=3D0004 c=3D7d BYTE_DATA l=3D1 [40] /* wr=
ite
> > back status register to clear warn bit */
> >
> > The last operation fails due to NACK received.
> > So I'm wondering - considering that this "write back" operation takes
> > place in the correct place, in the correct order and so on according
> > to PMBUS specification, could it be that the device itself does not
> > implement this correctly and simply responds with NACK to the write
> > back operation to status register?
> > On the other hand - why does it work correctly on LTC2974 but would
> > not work on LTC2977?
> >
> > I would be grateful for any insights or guidance on resolving this issu=
e.
> >

Hi, thanks for the response
> Datasheets will tell you: The status registers are supposed to be read-on=
ly
> on those chips.
I'm aware of this. Actually that's why I asked because I was a bit
confused when I noticed that the driver actually tries to write
something to readonly register which didn't work on LTC2977, but on
the other hand worked correctly with LTC2974.

> We'll need to add some code to detect that condition and
> refrain from clearing the status register if the chip doesn't support
> writes (or maybe ignore errors from the clear operation). Ignoring the
> error might be the easiest fix.
I will apply this fix to our codebase then, unless I come up with a better =
idea.

Thanks for clarification

BR
Patryk
