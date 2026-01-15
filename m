Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ED5376BD4
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Jan 2026 13:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768485500; cv=none; b=th4bWVzvfvP+WeGbDCajvfj+GolHmpYdF64oam0g4e/+ePaUV5aIf76RiwKTkAPgXzgus0v7PjIZBhTvsCXYI4TQxD7zDAfJ6kzOSZ0KFij+StXerivyDyrC5xN8eH2G16KFd2xKS0VTbrnZ8ysgcKaLjwX9xapF3SJloGICyIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768485500; c=relaxed/simple;
	bh=Z9njSG7eoW+Ncb+Q6MAD/+ODvsgl3IOOh9f/iaptpwU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=GVH6HUHzB0vaIvuGG0avBKEnbdMLHQ/YUNFEnP3FvPEoozikRJn8bGyGaCOrtZGI181lfepLqPIkDdfxwJtj7ax2SmHess77BY8wMwCYWX20fX3WRhWbkhOlZFwI1OebpFD5RIEcT3GqzdFdW29P2GGOJ2UYYm8GOr+vvkjNL5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=StsfB9uh; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="StsfB9uh"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-55b6a66f155so415264e0c.3
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Jan 2026 05:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768485498; x=1769090298; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzyXVHHavXCQ5gEzwVUkmdYLoNhapC3MYLyxVlPnYQQ=;
        b=StsfB9uhrXGQzdTzBSJP33u1CwsNGeLrKC/p4agyD7csMufCWpG/P3C4u0oGmKmE2e
         iMAjgQ85zaD47T8bIvwbAN1eK5vqsHK0DYnRXTRlbIdOYnbrQ+A8mrvRRYIYTKs9IVzL
         3BQSQ5sPbGeQzAhxSs53aSucI8Ikba76zwxSM2UBG5Of8jn4PMnkc/Jl/WB2jZky616k
         +jL9kLnDpf13FSO8OB8TFCq8ATnb9H9eh5K5TIFlzXxNpEXQn6QSSvCc8R7oDHBKqdQ3
         PziLb9A2D93LBffhekOA53vHifZePqdCOvJCBTOIPdmZqz8p8YHrzNPe+X3JZ5d7aqbv
         OJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768485498; x=1769090298;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AzyXVHHavXCQ5gEzwVUkmdYLoNhapC3MYLyxVlPnYQQ=;
        b=NpaSoti21KGH75jCT+L/Gm6FNwLKB3w2WYSIe3gN+x31/STQev8Jmk1QP5a0B6KcXI
         3/dc8yqUdmLiXBsOXcfuud5JV/GCVPR+0RX4uLi9ibXXOZ5BSYmfL12iuyY4gFJaBKR8
         XyKavcV3ZL9luy3DbzXG5ILUP2e65CnqQycSKj06nC4EcYgMlKRbXiV0J1Go/Drln1/6
         4K/v39lUSvz0SvJgMl5M1XX+97SBLHFS5bEPIs0Rav3jXW1sWx9IlSHxKrS5V+QNXkB/
         uaGxRqjczLv20LCOO/cXPW5MhVz7U01fSETkkYGCiQLgkbvJdlTotvfPpceh6ty0ukJ4
         VWXg==
X-Forwarded-Encrypted: i=1; AJvYcCXRNtGgzSADS/I34U+r8WvpHYAMyrct5kqp/QAyO4KJRkcT7U2C/SmN0ApntfLJwMOKSaODPEEhKOmnkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTKVTZudBGNCQQGzBEFjPGtThYtn8K53xWXVy7y283o30nOZCo
	M8NDMjrFp4IqZB3dxleFqofIOVX3U5jEUeO5gt8QgiloS9xbHdGO2lGYQy3ZHJvi
X-Gm-Gg: AY/fxX4QeBS5U8Qd5Yk4QJ1CbhXS5ORB2r7d2VB8bcHF5vve98m0jAQ85YnlyH4mUb1
	pF36VTLwPMpZ1Gd26TcDoe4GVGgm5PuvqDTlXhztDcoelg2nFGLgKibsCfZzIikCQfRRXdV9lwi
	8z+ob1m3EvkDZUkAR6CUaoP3eJPIhx0OIL1DqW7IvZ9DvZMbpGRZViuYwfwqr/hH/u9aYCTDe0k
	JZbKyJLklbFBiJ9oQ+womCpKJ2dJEe+u0jXup4cRKDQNjSaeJg6nqr675pUz4khPma9Y2fye+Nt
	ycxLfXwQxtZJUSGUoaq9z6SRXpw1w13xyDdqL5Ufv+njHHL4gzv0wtJf75feMRMA6d2J6UnyO9l
	s4LDN3f360o59/bciDD9G9guRUljxdop9pASaiwb6640fcTsQt01IWpYQJ3WIr6WXjaxHou8Mj+
	IMKA==
X-Received: by 2002:a05:6122:3b81:b0:563:4a88:6ea5 with SMTP id 71dfb90a1353d-563a2093a5dmr2064461e0c.5.1768485497846;
        Thu, 15 Jan 2026 05:58:17 -0800 (PST)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5638821427dsm11317889e0c.18.2026.01.15.05.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 05:58:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Jan 2026 08:58:10 -0500
Message-Id: <DFP7SAGSD32N.3SIIV8JMYHWRM@gmail.com>
To: "Rong Zhang" <i@rong.moe>, "Kurt Borja" <kuurtb@gmail.com>
Cc: "Mark Pearson" <mpearson-lenovo@squebb.ca>, "Derek J. Clark"
 <derekjohn.clark@gmail.com>, "Armin Wolf" <W_Armin@gmx.de>, "Hans de Goede"
 <hansg@kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Guenter Roeck" <linux@roeck-us.net>,
 <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v9 7/7] platform/x86: lenovo-wmi-other: Add HWMON for
 fan reporting/tuning
From: "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260114122745.986699-1-i@rong.moe>
 <20260114122745.986699-8-i@rong.moe> <DFOQB6DGBKBZ.39JQKPB7XDSJG@gmail.com>
 <1a9909f4083d85736a1e28067517ae0899e462f2.camel@rong.moe>
In-Reply-To: <1a9909f4083d85736a1e28067517ae0899e462f2.camel@rong.moe>

On Thu Jan 15, 2026 at 8:03 AM -05, Rong Zhang wrote:
> Hi Kurt,
>
> On Wed, 2026-01-14 at 19:16 -0500, Kurt Borja wrote:
>> Hi Rong,
>>=20
>> On Wed Jan 14, 2026 at 7:27 AM -05, Rong Zhang wrote:
>> > Register an HWMON device for fan reporting/tuning according to
>> > Capability Data 00 (capdata00) and Fan Test Data (capdata_fan) provide=
d
>> > by lenovo-wmi-capdata. The corresponding HWMON nodes are:
>> >=20
>> >  - fanX_enable: enable/disable the fan (tunable)
>> >  - fanX_input: current RPM
>> >  - fanX_max: maximum RPM
>> >  - fanX_min: minimum RPM
>> >  - fanX_target: target RPM (tunable)
>> >=20
>> > Information from capdata00 and capdata_fan are used to control the
>> > visibility and constraints of HWMON attributes. Fan info from capdata0=
0
>> > is collected on bind, while fan info from capdata_fan is collected in =
a
>> > callback. Once all fan info is collected, register the HWMON device.
>> >=20
>> > Signed-off-by: Rong Zhang <i@rong.moe>
>> > Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
>> > ---
>>=20
>> ...
>>=20
>> > diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Document=
ation/wmi/devices/lenovo-wmi-other.rst
>> > index 821282e07d93c..bd1d733ff286d 100644
>> > --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
>> > +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
>> > @@ -31,6 +31,8 @@ under the following path:
>> > =20
>> >    /sys/class/firmware-attributes/lenovo-wmi-other/attributes/<attribu=
te>/
>> > =20
>> > +Additionally, this driver also exports attributes to HWMON.
>> > +
>> >  LENOVO_CAPABILITY_DATA_00
>> >  -------------------------
>> > =20
>> > @@ -39,6 +41,11 @@ WMI GUID ``362A3AFE-3D96-4665-8530-96DAD5BB300E``
>> >  The LENOVO_CAPABILITY_DATA_00 interface provides various information =
that
>> >  does not rely on the gamezone thermal mode.
>> > =20
>> > +The following HWMON attributes are implemented:
>> > + - fanX_enable: enable/disable the fan (tunable)
>>=20
>> I was testing this series and I'm a bit confused about fanX_enable.
>
> Thanks for testing!

Thanks for working on this!

>
>> Judging by this comment and also by taking a quick look at the code, it
>> looks like writting 0 to this attribute disables the fan.
>>=20
>> This is however (per hwmon ABI documentation [1]) not how this attribute
>> should work. IIUC, it is intended for devices which can disable the fan
>> sensor, not the actual fan.
>
> Hmm, what a confusing name :-/
>
>> I fail to see how this feature is useful and I also find it dangerous
>> for this to be exposed by default, considering the same could be
>> achieved with the relaxed module parameter, which at least tells the
>> user to be careful.
>
> Makes sense. I will remove the attribute and mention such behavior in
> the module parameter.

Also, it would be worth to mention that writting 0 to the fanY_target
attribute is auto mode, right?

I was testing the fanX_target attribute and it does work as intended,
i.e. the fan speed changes to the desired speed. However, every time I
write to this attribute I'm getting -EIO error and it always reads 0.

For example:

	$ echo 3550 | sudo tee fan*_target
	3550
	tee: fan1_target: Input/output error
	tee: fan2_target: Input/output error
	$ cat fan*_target
	0
	0

But as I said, the fans do reach the desired speed (an approximation of
it):

	$ cat fan*_input
	3500
	3500

This is a bit weird, but I haven't look in depth into it. I will find
some time to do it later. This happens on a 83KY (Legion 7 16IAX1)
laptop.

As it seems that you can change the RPM in 100 increments, maybe you
could look into the pwmY attributes [1]. I think it is a better fit for
this feature because pwmY_enable allows you to select between manual and
auto fan control [2], and I believe some user-space tools already use
this attribute.

On the implementation you can use fixp_linear_interpolate() [3] to
convert between and from pwm duty cycle.

This is just a suggestion though, I know I came in too late to the
discussion but I just got this laptop :P

[1] https://elixir.bootlin.com/linux/v6.19-rc5/source/Documentation/ABI/tes=
ting/sysfs-class-hwmon#L297
[2] https://elixir.bootlin.com/linux/v6.19-rc5/source/Documentation/ABI/tes=
ting/sysfs-class-hwmon#L312
[3] https://elixir.bootlin.com/linux/v6.19-rc5/source/include/linux/fixp-ar=
ith.h#L145


--=20
Thanks,
 ~ Kurt

