Received: from out203-205-221-205.mail.qq.com (out203-205-221-205.mail.qq.com [203.205.221.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D99237702E;
	Sat, 22 Aug 2026 12:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787401425; cv=none; b=OqsVzGtK+GOe/lUEynsibjw/6SYq5KEttu2/IcaGmwU330sVaTlKiDhn+pzQmPEmXw+f71oDeMj29mJy1WPE+4a1EOMQS9BvOEe7G6Z0+WL6mv8LXi/NlyV7MR25L610Y0W+pxgf/ngcs5f2BanNebu8NroWX5q2cK8Hh9XdEnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787401425; c=relaxed/simple;
	bh=hJyM7Wb09cha2wZgSrPJf4hJ2fTzOmFl7tLffzf0KuM=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=B1FNsqTm99qsR+8lLo1iFN3S0JQI2P+H2cAYskV+VSjHkjeowLnIPcwhzA91kQ75VOhokuRLaIPl6iUsDuolCQX5VIhXAseItb0rJUVtLt8AvHbtoKDD+Ls+HdFG1bjlFcvdJru2dr6sbu82TaSxCPvNW38GWA2d4SmFmCx2koU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Wq+88Yrd; arc=none smtp.client-ip=203.205.221.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Wq+88Yrd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787401419; bh=rcqGLtKIlxFqGb88vfbAOP8XI1J82qUAcUU5ULRtdbk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Wq+88YrdkBpNNoVMoXgh518xdnHxveh/uuFpFIEsTTqTJKsIl5K+CNixKBPKWgqQL
	 f2pfjl9R2DsOytWD6U5+wTBlroKB+C3NvTHpMcQBfcdplKmbXnm18sUrZ4yMcSLuAZ
	 LcKC77X9ublNo87PneGrXLztFWhjpEWN6c7nvb8E=
Received: from lxu-ped-host.. ([111.198.231.89])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 5E28543D; Sat, 22 Aug 2026 20:23:34 +0800
X-QQ-mid: xmsmtpt1787401414tf1cjinza
Message-ID: <tencent_71B8A5DC0D8A9202DDCBDDA4990FCF928D07@qq.com>
X-QQ-XMAILINFO: N7h1OCCDntuje8ziDd0a5g5ce/uKDnGjkv6+LV008PcwRoVv5Au286Z1Ya0uZ3
	 hRu1Cxa9XOwPg0lbA9hsQOycaKmiGJBYaW20sqZ89Bt7/Tu631r5OiXTmMEO1JKMdU4Ko5pDA0JB
	 23l0YvAh3+E2HtnYYhhaq638tR/+O5+GO2x7yv3MKU/fPH4yXvuPMw0TkO/ocR4WMx6r4gtwyW5k
	 28LbEMFDFuC5gBo6M/K1aMDCMXBU2jMC7glPxAccqYsTImUpzcd+2f/x7KuRXwMH4V6DS6yn6mk8
	 T8i+C7d7Tf92hd+SBxsELBDNByuj42u5Vl7XZTW81Z/n+4zXrxfNDzjeSJMjKv5It2vzTw0nWBgR
	 wM/FYa+TG7vhYzy3MZKa3rAUfx/4LTVNfFI8QrJtFFUCAU5WD/tbQk1T/2Lg8ie5cgToqDzFMW/9
	 fXUo2GH1Vnibo5x07xfqYk/CEza5o9nBnNI5Jw34kQuEGm8mQ/8OZ69KAWimPT3p6Bts1tGhPyrU
	 1nyKT/q/OCbr0C5oC9TMlL7vGFKWpTYdvbxJP/2738cC2M0WmXgTplZRZyTC4ef8jYA8YmC/Q3xO
	 zUv6mwclXBtTcUY8widZWFPdPATyFk7iHp2C7PaPHstYsYsSjpH+vYn05Ws/fdcZnxQquAGN/Qwl
	 Q8GJdEIprDeYSUZ6M1Q/rANJhz2hZMXLJLc8zrjlkq4Tm0s2Uk35cfyLOGg+fX3QGtFkqyBYt5v2
	 XynmEfHkwiTgPgFe3myo8f11rb/2uSPFWkD2in2EXwHmnJ0XAv5S4xI946toBxzqNUTRMxzB5mwj
	 dx36VMqTkCvOjcPJhD6OtJ7W1lqYWckilEeGAQynSV6k3Ka1bWx9SDtkyX5bo88UyTA83o3f63WO
	 hEZ76RKFRKj+TVYfVM1loX5XGrkLihFk31NVf/lCYaFgf+y/twvhC82/5Vb6bBNxg5qEJxmqSBZs
	 2FIwtWyxNdFKlpUAQedJTnES8sifwHi9EDzYbAtEtRTlzJ3Fli+Y8PQGf4/eG4YcXCeWU8nY1+pU
	 1fRsKME67hz4JpjaWYVRba1qgBRbnoFGeKGCVWujV4tA6h9XZGf9MdNih9d/7LXv6cMZL/ff7nIq
	 SZQcvXDNVi0IrOgfuB5amSajQiJA==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Edward Adam Davis <eadavis@qq.com>
To: gregkh@linuxfoundation.org
Cc: eadavis@qq.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	me@jackdoan.com,
	sashiko-bot@kernel.org,
	sashiko-reviews@lists.linux.dev,
	savicaleksa83@gmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH v4] hwmon: (aquacomputer_d5next) valid the data size before reading the sensor data
Date: Sat, 22 Aug 2026 20:23:35 +0800
X-OQ-MSGID: <20260822122334.86810-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026082252-clerk-anointer-ceaf@gregkh>
References: <2026082252-clerk-anointer-ceaf@gregkh>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 22 Aug 2026 13:55:35 +0200, Greg KH wrote:
> On Sat, Aug 22, 2026 at 07:34:35PM +0800, Edward Adam Davis wrote:
> > The user-forged sensor data is only 65 bytes long; however, aqc_raw_event()
> > fails to handle cases where the sensor data length is too small when reading
> > the data, resulting in [1] during the read process.
> 
> What is "user-forged sensor data"?
It is the data constructed within the reproducer.
> 
> > 
> > Add a data size check, if the size is less than that required for the
> > specific data item to be read, abort the sensor data read operation.
> 
> This patch does much more than that.
Got it, I will write more comments.
> 
> > 
> > [1]
> > BUG: KASAN: slab-out-of-bounds in aqc_raw_event+0x213e/0x25d0 drivers/hwmon/aquacomputer_d5next.c:1327
> > Read of size 2 at addr ffff888108aba257 by task swapper/1/0
> > Call Trace:
> >  get_unaligned_be16 include/linux/unaligned.h:48 [inline]
> >  aqc_raw_event drivers/hwmon/aquacomputer_d5next.c:1345 [inline]
> >  aqc_raw_event+0x213e/0x25d0 drivers/hwmon/aquacomputer_d5next.c:1327
> >  __hid_input_report.constprop.0+0x319/0x470 drivers/hid/hid-core.c:2168
> >  hid_irq_in+0x55d/0x710 drivers/hid/usbhid/hid-core.c:287
> >  __usb_hcd_giveback_urb+0x38d/0x610 drivers/usb/core/hcd.c:1657
> >  usb_hcd_giveback_urb+0x3ca/0x4a0 drivers/usb/core/hcd.c:1741
> > 
> > Fixes: 0e35f63f7f4e ("hwmon: add driver for Aquacomputer D5 Next")
> > Reported-by: syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=9ee5f5dc18673d6b2f37
> > Tested-by: syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com
> > Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> > ---
> 
> Was the Assisted-by: tag forgotten?
No one has assisted me so far; also, I haven't used this type of tag before.
> 
> 
> > v1 -> v2: change to check the data item and update comments
> > v2 -> v3: check all sub items and update subject
> > v3 -> v4: add speed and flow check
> > 
> >  drivers/hwmon/aquacomputer_d5next.c | 104 ++++++++++++++++++++++++++++
> >  1 file changed, 104 insertions(+)
> > 
> > diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
> > index 1ca70e726298..89c9fc0c77e5 100644
> > --- a/drivers/hwmon/aquacomputer_d5next.c
> > +++ b/drivers/hwmon/aquacomputer_d5next.c
> > @@ -1324,6 +1324,107 @@ static const struct hwmon_chip_info aqc_chip_info = {
> >  	.info = aqc_info,
> >  };
> >  
> > +/* aqc_raw_data_valid()
> > + * Does not support special-case sensor readings data size check
> 
> Why not?
It would be more appropriate for the maintainers of these sensors to add
the relevant checks.
> 
> > + */
> > +static bool aqc_raw_data_valid(struct aqc_data *priv, int size)
> > +{
> > +	int off, fan_off, i;
> > +	char *msg;
> > +
> > +	if (!priv)
> > +		return false;
> > +
> > +	/* +1 for get_unaligned_be16(), it reads 2 bytes */
> > +	off = priv->serial_number_start_offset + SERIAL_PART_OFFSET + 1;
> > +	if (off >= size) {
> > +		msg = "serial number start offset";
> 
> That's a lot of debugging code being added, why?  Who is going to use
> that?
I am not certain that these debug messages are definitely useful;
I simply included them because I felt they might be helpful.
> 
> 
> 
> > +		goto invalid;
> > +	}
> > +
> > +	off = priv->firmware_version_offset + 1;
> > +	if (off >= size) {
> > +		msg = "firmware version offset";
> > +		goto invalid;
> > +	}
> > +
> > +	/* Physical temperature sensor readings data size check*/
> > +	for (i = 0; i < priv->num_temp_sensors; i++) {
> > +		off = priv->temp_sensor_start_offset + i * AQC_SENSOR_SIZE + 1;
> > +
> > +		if (off >= size) {
> > +			msg = "temp sensor start offset";
> > +			goto invalid;
> > +		}
> > +	}
> > +
> > +	/* Virtual temperature sensor readings data size check*/
> > +	for (i = 0; i < priv->num_virtual_temp_sensors; i++) {
> > +		off = priv->virtual_temp_sensor_start_offset +
> > +		      i * AQC_SENSOR_SIZE + 1;
> > +
> > +		if (off >= size) {
> > +			msg = "virtual temp sensor start offset";
> > +			goto invalid;
> > +		}
> > +	}
> > +
> > +	/* Fan speed and related readings data size check */
> > +	if (!priv->fan_structure)
> > +		goto flow;
> > +
> > +	for (i = 0; i < priv->num_fans; i++) {
> > +		fan_off = priv->fan_sensor_offsets[i] + 1;
> > +		off = fan_off + priv->fan_structure->speed;
> > +		if (off >= size) {
> > +			msg = "fan speed offset";
> > +			goto invalid;
> > +		}
> > +
> > +		off = fan_off + priv->fan_structure->power;
> > +		if (off >= size) {
> > +			msg = "fan power offset";
> > +			goto invalid;
> > +		}
> > +
> > +		off = fan_off + priv->fan_structure->voltage;
> > +		if (off >= size) {
> > +			msg = "fan voltage offset";
> > +			goto invalid;
> > +		}
> > +
> > +		off = fan_off + priv->fan_structure->curr;
> > +		if (off >= size) {
> > +			msg = "fan curr offset";
> > +			goto invalid;
> > +		}
> > +	}
> > +
> > +flow:
> > +	/* Flow sensor readings data size check */
> > +	for (i = 0; i < priv->num_flow_sensors; i++) {
> > +		off = priv->flow_sensors_start_offset + i * AQC_SENSOR_SIZE + 1;
> > +		if (off >= size) {
> > +			msg = "flow sensors start offset";
> > +			goto invalid;
> > +		}
> > +	}
> > +
> > +	if (priv->power_cycle_count_offset != 0) {
> > +		off = priv->power_cycle_count_offset + 3;
> > +		if (off >= size) {
> > +			msg = "power cycle count offset";
> > +			goto invalid;
> > +		}
> > +	}
> > +
> > +	return true;
> > +invalid:
> > +	pr_debug("data size (%d) is less than the %s, %s\n",
> > +		 size, msg, __func__);
> 
> drivers should always use dev_dbg().
> 
> also pr_debug() already has __func__ in it.  Please fix your LLM.
Got it.

BR,
Edward

