Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBFE39CCFA;
	Sat, 22 Aug 2026 07:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787385311; cv=none; b=Pb6pVVwFsLqn47ZqVVln70iYKxj92YXoh3Om72nZCVKh8f+mZynpDbVhhOEMJ1gmMSMdFKeoWSkLhSpf1jxD46Y3WQpxHFdRfnynK/Z5EoJWhYQoMQk863vH8jE4M++iPG5KxKkRf1DW2zK3FVCZl2YOdfsfCMsNdfstck/JrPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787385311; c=relaxed/simple;
	bh=zt+7X7rMMhsfv+IJaDHvjaDH9ihkDeg+xMYWXr0gKKA=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=ABfjboPbvsdYZhZKTI2ofVAq9I9+h0sCV8q9+gIwoXZbiiX8bWnWaJPJz1WX5n2gcyqi7IolSVezxpoNooN4CyF04gp943iQ91BV76jyYA9wSbhZyWErzvdpXwKrM6fECLX2rQNKqQi+izgqWvkhhPS7QZhsU2iGsz1L3L9HlH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=a9GXd7NF; arc=none smtp.client-ip=203.205.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="a9GXd7NF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787385299; bh=SV3rT+BO8A0nracW/hH1culHKAK+TxXLsq57kEVC28s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a9GXd7NFs6LpbD4Yxuy1JxKaliYUUKAbTGt7NCDv7iyyg8Kj9AB3rKDisXqZe89Lb
	 r7UbZIdONU4WwKuOJfZ1rTdOK/5Utr6RHDlMKWqjYrZnHARnsxxpRqO8qlcRHs4Eau
	 O0aRhzxKCuos7IS3MqidrZNQHgJo7KbsyXBEhNWc=
Received: from lxu-ped-host.. ([111.198.231.89])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id DB806858; Sat, 22 Aug 2026 15:54:56 +0800
X-QQ-mid: xmsmtpt1787385296tioccm0r7
Message-ID: <tencent_73C30DF79232DDC35D9A9940CF9B8DB92507@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNznxpCmW3QjH4u6V2dik/ymlIdTQueXqm1nVKbe/uqFe7sGXnsPS2
	 9+C9LL5eR2L5oV+p0GSjIsEwi5maElmO/VKVPDriUOl4a4e8DPkqc29tcWTZ7aTcIs1G4k5Ck/e+
	 yJ+YlcIDJD+rSXgoHc50lBPz4H4bYlehkk5JkYb50mvUjEfKy6c0tNOAzBgG0HwTDM6V4AOQpxAb
	 tmBBj5fv9BSuDX5ckXP/to4Y3ZpcB13nQ/B7R8P9wvSlx3v3vvRo2u8o+yfazm1MRXITjeSH/BbX
	 nH1uSJ2+ESPe8/YMwzkjBr4vEe4EpHIvcBPpwtg+XT3NV8YC4oh8ycaL4v4XQkykuXkMbJTwPEeH
	 xOaaACVgfYVd1AnpFcEXdPPj/YHFDH/eQ/5bJQHPapTOucWBZlv/fqQ/WIf7eSnWW549w6uLsEpc
	 SAWyk+pSr3F48/MZKrZUP5dOQmUPgzldxGIN9Dz4nREkTXIuIcxlcDrM4wZFGaIwqorR8QJyCIbM
	 FnURKaSjUsbmOQDEo84b9c4zk9YcmHChjy1GfPuhdlEhsGP5MtyaEFtIgh104m7Cr7HrmSsE980K
	 LS4jP34gHoSq3HL+OQV/Uqmoxw3tyvbRX+WIVd0HEA1aQdmC47LjwMhyav9O7ANFmcdGMoVs2rEm
	 jinbDR/Xhro4XmlStmOyiJ7TMExNyP99SF5tkUAEvbD31W3iruej1kxZpUttnHvzcG7Bm67kHdOO
	 er3VaZiZHUOUz5I9dpfX4mn8eAP2z0DHO38cFzsFKd/jTb6F3e3y1rXTJLucCm1JczARqA04Fztc
	 eObrNJsmbzbJ0n815mjLYC7syyFdsRUU3dqK22YGVC0uRdepybwEf92buBfA6WjO1bBqNgACQbXH
	 b4optHr8JRT0FZABPQ19gEEkugT/ZHCbxrvPXLKF5Y1eZz7rvN25N7LVHMY9Mrs87+nPiKEa3dhU
	 TnkPA+s23Ve28MD5WiqhWISkdALZOiH1ihiQ/S3zvQalH8D+XT3OkT78rFBgb77f1wPtn2VMcgJ3
	 fljfqNwh6FBySWFeBpvXlGdSaf+mU=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Edward Adam Davis <eadavis@qq.com>
To: linux@roeck-us.net
Cc: eadavis@qq.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	me@jackdoan.com,
	savicaleksa83@gmail.com,
	syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] hwmon: valid the data size before reading the sensor data
Date: Sat, 22 Aug 2026 15:54:57 +0800
X-OQ-MSGID: <20260822075456.74497-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <31df411d-e257-458d-98e5-c2920915294d@roeck-us.net>
References: <31df411d-e257-458d-98e5-c2920915294d@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 21 Aug 2026 23:41:26 -0700, Guenter Roeck wrote:
> Subject is supposed to be "hwmon: (driver) Description".
Oh, got it.
> 
> On 8/21/26 22:34, Edward Adam Davis wrote:
> > The user-forged sensor data is only 65 bytes long; however, aqc_raw_event()
> > fails to handle cases where the sensor data length is smaller than the buffer
> > size when reading the data, resulting in [1] during the read process.
> >
> 
> The device simulated by syzbot is D5 next, and its control buffer size is
> 0x329 or 809. I _asked_ earlier if that is the value to check against,
> but did not claim that this is actually the case.
> 
> We know that the report must be much longer than 65 bytes. D5NEXT_PUMP_OFFSET
> is 0x6c = 108, and the field is two bytes long, meaning the report size
> must be at least 110 bytes long. What we do not know is its actual length.
> 
> > Add a check for the data size, if it less than the buffer size, the sensor
> > data read is aborted.
> >
> 
> Apparently Sashiko is aware that this is wrong - not only is the report size
> smaller than 809 bytes, but apparently buffer_size is not even set for all
> supported devices.
Yes, I also realized that relying solely on the buffer size for the check
might be too simplistic or crude, so I adjusted the data length verification
method and submitted a second version of the patch.

BR,
Edward

