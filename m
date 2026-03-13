Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828FA2DECA3
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Mar 2026 12:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405593; cv=none; b=ODvgJU+OhkSGwReMKeroxBo7TIwmVY/iQBx2dlzVXIQ9mCF996W8/0ing/kB0MUeXRVsTFGE73ON3JYPdY6gzWWonQn+EMAmQSFy00mM+BpWVdOdUtgfCdssDxah7dUSU9/DJq2hVx5XalkKs53P6qD0VyK1WnLPlcCbLqgw0/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405593; c=relaxed/simple;
	bh=7zOCyfS+8I6E4UkDkb0ds+65JxGg16zcxJDCF7k/Lo0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=JnuOVZNjWBQaUNdirdEOylgxyMx5R3WA93vzfxheAHXqV3a9cDagNWoPEt8dQcIQP4T7UMwRLEP3gUc5Nj8kr0y+fw3rhxNtGGUyC6rlNnj39+leN7Mujn4Bu7P+pUrPyd653Uv/OhhxvghHLU76fjNtzSnDTYXfU3QDcafsDMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=jan.claussen10@web.de header.b=MdOHcWQD; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=jan.claussen10@web.de header.b="MdOHcWQD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1773405584; x=1774010384; i=jan.claussen10@web.de;
	bh=7zOCyfS+8I6E4UkDkb0ds+65JxGg16zcxJDCF7k/Lo0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=MdOHcWQDDFHmCJnCLe5E6hPR/4nFeoyFkK7pQyYuOlbWRULPEAXUBfJOxH61D6QR
	 PseNPgfF+32X0pAvB/9nXbRI1vAvEDbsvmQFizXXWGbbYnd/wg95QXY4yUNdF4GDo
	 6Emy1iScgw7fIRHZYYHVdduQhScvmCEb17apdgIX4/cMrqY5kJcycVniVAKDY4dzl
	 GAmmVOvJzK+ZVnPwtCijzTId4eNIre1N5XlnQG6LPc8u+lXRaEk6F6dF3E1OjQ+ej
	 99PXaQ6ME15E3YeB/yMwiMTibWehuPqaNndTTwEXMjozN42lgEMRHvgRaorVYkrJi
	 EjQLtCtpf/bkJBlxhA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MhWop-1vOPWl06Md-00iB4c for
 <linux-hwmon@vger.kernel.org>; Fri, 13 Mar 2026 13:39:44 +0100
Message-ID: <b476fdf2-1ce6-46ca-8c98-13e0ae1613b3@web.de>
Date: Fri, 13 Mar 2026 13:39:43 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-hwmon@vger.kernel.org
Content-Language: en-US
From: =?UTF-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>
Subject: Weird Dell SMM bug since 6.18
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MffI9v+IIERElL6xgAkKsHvhWkdge7F6//X2QevBmI8QwbOXrAg
 N+xfW1sd5dsq3G0+X8AS9v6FUg1+0ZWe2LlT3wQrBlJR2H9rHwL7C3lxXQqsmrMo2jdQE8F
 iTCSv/KLiRPG+gfDF81x611tDoXNI54rqjhRCivCstc7d80od6AhwPQOyEdwZQT1Z43jzJC
 PQ6jx2LF2D/TOxj6+AaDQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0NZSYKsVnCA=;7BZCBET9MvwIatqJiQexFpjRB1z
 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
 7f/Go6Fum3+1DGBMKtMW

Hi,

I've been experiencing a very weird bug since kernel 6.18 and had been=20
staying on 6.12 LTS because of it over the last months. I am using the=20
application coolercontrol to control the case fans on my old Dell=20
Precision 5810. Here is some background=20
https://gitlab.com/coolercontrol/coolercontrol/-/work_items/557

To be clear, I am not 100% sure if this is a bug in the kernel or in the=
=20
in the application. I am not the only one experiencing it though and the=
=20
maintainers of coolercontrol don't know what caused it either, so I am=20
hoping for some help/advice here.

The issue:

Everything was fine on 6.17 and when 6.18 was released coolercontrol=20
said it couldn't write the pwm attributes anymore. They were writable=20
using echo though. After downgrading to 6.17 everything was fine again.=20
I took the time to bisect the kernel from 6.17 to 6.18 and got the=20
following result:

c050daf69f3edf72e274eaa321f663b1779c4391 is the first bad commit
commit c050daf69f3edf72e274eaa321f663b1779c4391
Merge: 989253cc46ff 8f2689f194b8
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:=C2=A0 =C2=A0Wed Oct 1 10:33:17 2025 -0700

 =C2=A0 =C2=A0 Merge tag 'pwm/for-6.18-rc1' of=20
git://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux

 =C2=A0 =C2=A0 Pull pwm updates from Uwe Kleine-K=C3=B6nig:
 =C2=A0 =C2=A0 =C2=A0"The core highlights for this cycle are:

 =C2=A0 =C2=A0 =C2=A0 =C2=A0- The pca9586 driver was converted to the wave=
form API

 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Waveform drivers automatically provide a gpi=
o chip to make PWMs
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usable as GPIOs (The pca9586 driver did=
 that in a driver specific
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0implementation before)

 =C2=A0 =C2=A0 =C2=A0 Otherwise it's the usual mix of fixes and device tre=
e and driver
 =C2=A0 =C2=A0 =C2=A0 changes to support new hardware variants"

 =C2=A0 =C2=A0 * tag 'pwm/for-6.18-rc1' of=20
git://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux: (30 commits)
 =C2=A0 =C2=A0 =C2=A0 pwm: cros-ec: Avoid -Wflex-array-member-not-at-end w=
arnings
 =C2=A0 =C2=A0 =C2=A0 dt-bindings: pwm: samsung: add exynos8890 compatible
 =C2=A0 =C2=A0 =C2=A0 dt-bindings: pwm: apple,s5l-fpwm: Add t6020-fpwm com=
patible
 =C2=A0 =C2=A0 =C2=A0 dt-bindings: pwm: nxp,lpc1850-sct-pwm: Minor whitesp=
ace cleanup=20
in example
 =C2=A0 =C2=A0 =C2=A0 pwm: pca9586: Convert to waveform API
 =C2=A0 =C2=A0 =C2=A0 pwm: pca9685: Drop GPIO support
 =C2=A0 =C2=A0 =C2=A0 pwm: pca9685: Make use of register caching in regmap
 =C2=A0 =C2=A0 =C2=A0 pwm: pca9685: Use bulk write to atomicially update r=
egisters
 =C2=A0 =C2=A0 =C2=A0 pwm: pca9685: Don't disable hardware in .free()
 =C2=A0 =C2=A0 =C2=A0 pwm: Add the S32G support in the Freescale FTM drive=
r
 =C2=A0 =C2=A0 =C2=A0 dt-bindings: pwm: fsl,vf610-ftm-pwm: Add compatible =
for s32g2 and=20
s32g3
 =C2=A0 =C2=A0 =C2=A0 pwm: mediatek: Lock and cache clock rate
 =C2=A0 =C2=A0 =C2=A0 pwm: mediatek: Fix various issues in the .apply() ca=
llback
 =C2=A0 =C2=A0 =C2=A0 pwm: mediatek: Implement .get_state() callback
 =C2=A0 =C2=A0 =C2=A0 pwm: mediatek: Initialize clks when the hardware is =
enabled at=20
probe time
 =C2=A0 =C2=A0 =C2=A0 pwm: mediatek: Rework parameters for clk helper func=
tion
 =C2=A0 =C2=A0 =C2=A0 pwm: mediatek: Introduce and use a few more register=
 defines
 =C2=A0 =C2=A0 =C2=A0 pwm: mediatek: Simplify representation of channel of=
fsets
 =C2=A0 =C2=A0 =C2=A0 pwm: tiecap: Document behaviour of hardware disable
 =C2=A0 =C2=A0 =C2=A0 pwm: Provide a gpio device for waveform drivers
 =C2=A0 =C2=A0 =C2=A0 ...

 =C2=A0Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml=C2=A0 =C2=
=A0 =C2=A0 | =C2=A03 +-
 =C2=A0Documentation/devicetree/bindings/pwm/fsl,vf610-ftm-pwm.yaml=C2=A0 =
=C2=A0| 11 ++--
 =C2=A0Documentation/devicetree/bindings/pwm/nxp,lpc1850-sct-pwm.yaml | =
=C2=A02 +-
 =C2=A0Documentation/devicetree/bindings/pwm/pwm-samsung.yaml=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| =C2=A01 +
 =C2=A0Documentation/devicetree/bindings/timer/renesas,rz-mtu3.yaml=C2=A0 =
=C2=A0| =C2=A07 ++-
 =C2=A0drivers/pwm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A09 ++++
 =C2=A0drivers/pwm/core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 108=20
+++++++++++++++++++++++++++++++++-----
 =C2=A0drivers/pwm/pwm-berlin.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A04 +-
 =C2=A0drivers/pwm/pwm-cros-ec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 10 ++--
 =C2=A0drivers/pwm/pwm-fsl-ftm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 35=20
++++++++++++-
 =C2=A0drivers/pwm/pwm-loongson.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A02 +-
 =C2=A0drivers/pwm/pwm-mediatek.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 308=20
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++------------------------------
 =C2=A0drivers/pwm/pwm-pca9685.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 515=20
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
=2D-----------------------------------------------------------------------=
=2D----------------------------------
 =C2=A0drivers/pwm/pwm-tiecap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A04 ++
 =C2=A0drivers/pwm/pwm-tiehrpwm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 154=20
++++++++++++++++++++++--------------------------------
 =C2=A0include/linux/pwm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A03 ++
 =C2=A016 files changed, 661 insertions(+), 515 deletions(-)

This seemed like it could be it, as it's pwm-related, but nothing=20
Dell-specific. One merge before though there was

1c1658058c99 hwmon: (dell-smm) Add support for automatic fan mode

which could be related. Since the pwm_enable attribute was introduced in=
=20
6.18, I am suspecting it has something to do with it.

Now the weird part:

git bisect start
# Status: warte auf guten und schlechten Commit
# good: [e5f0a698b34ed76002dc5cff3804a61c80233a7a] Linux 6.17
git bisect good e5f0a698b34ed76002dc5cff3804a61c80233a7a
# Status: warte auf schlechten Commit, 1 guter Commit bekannt
# bad: [7d0a66e4bb9081d75c82ec4957c50034cb0ea449] Linux 6.18
git bisect bad 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
# bad: [f79e772258df311c2cb21594ca0996318e720d28] Merge tag=20
'media/v6.18-1' of=20
git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
git bisect bad f79e772258df311c2cb21594ca0996318e720d28
# bad: [0f048c878ee32a4259dbf28e0ad8fd0b71ee0085] Merge tag=20
'soc-dt-6.18' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect bad 0f048c878ee32a4259dbf28e0ad8fd0b71ee0085
# bad: [c050daf69f3edf72e274eaa321f663b1779c4391] Merge tag=20
'pwm/for-6.18-rc1' of=20
git://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux
git bisect bad c050daf69f3edf72e274eaa321f663b1779c4391
# good: [a23cd25baed2316e50597f8b67192bdc904f955b] Merge tag=20
'sched_ext-for-6.18' of=20
git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext
git bisect good a23cd25baed2316e50597f8b67192bdc904f955b
# good: [4b81e2eb9e4db8f6094c077d0c8b27c264901c1b] Merge tag=20
'timers-vdso-2025-09-29' of=20
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect good 4b81e2eb9e4db8f6094c077d0c8b27c264901c1b
# good: [ae28ed4578e6d5a481e39c5a9827f27048661fdd] Merge tag=20
'bpf-next-6.18' of=20
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next
git bisect good ae28ed4578e6d5a481e39c5a9827f27048661fdd
# good: [eb3289fc474f74105e0627bf508e3f9742fd3b63] Merge tag=20
'driver-core-6.18-rc1' of=20
git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core
git bisect good eb3289fc474f74105e0627bf508e3f9742fd3b63
# good: [eb3289fc474f74105e0627bf508e3f9742fd3b63] Merge tag=20
'driver-core-6.18-rc1' of=20
git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core
git bisect good eb3289fc474f74105e0627bf508e3f9742fd3b63
# good: [7e5969a4d3e794993c9ca8d4026cf31a34b32b30] dt-bindings:=20
trivial-devices: Add sht2x sensors
git bisect good 7e5969a4d3e794993c9ca8d4026cf31a34b32b30
# good: [7e5969a4d3e794993c9ca8d4026cf31a34b32b30] dt-bindings:=20
trivial-devices: Add sht2x sensors
git bisect good 7e5969a4d3e794993c9ca8d4026cf31a34b32b30
# good: [989253cc46ff3f4973495b58e02c7fcb1ffb713e] Merge tag=20
'hwmon-for-v6.18-rc1' of=20
git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging
git bisect good 989253cc46ff3f4973495b58e02c7fcb1ffb713e
# good: [f43e1280731c2a6bbd2d9517fd6b726d6ebe6641] pwm: mediatek: Rework=
=20
parameters for clk helper function
git bisect good f43e1280731c2a6bbd2d9517fd6b726d6ebe6641
# good: [de5855613263b426ee697dd30224322f2e634dec] pwm: pca9685: Use=20
bulk write to atomicially update registers
git bisect good de5855613263b426ee697dd30224322f2e634dec
# good: [efedb508591e231b47b23ce6b353c81eeb3b9a84] dt-bindings: pwm:=20
nxp,lpc1850-sct-pwm: Minor whitespace cleanup in example
git bisect good efedb508591e231b47b23ce6b353c81eeb3b9a84
# good: [ebd524a3ac3a172aa26f99d20d4d00d57da9a875] dt-bindings: pwm:=20
samsung: add exynos8890 compatible
git bisect good ebd524a3ac3a172aa26f99d20d4d00d57da9a875
# good: [8f2689f194b8d1bff41150ae316abdfccf191309] pwm: cros-ec: Avoid=20
-Wflex-array-member-not-at-end warnings
git bisect good 8f2689f194b8d1bff41150ae316abdfccf191309
# first bad commit: [c050daf69f3edf72e274eaa321f663b1779c4391] Merge tag=
=20
'pwm/for-6.18-rc1' of=20
git://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux
# good: [c050daf69f3edf72e274eaa321f663b1779c4391] Merge tag=20
'pwm/for-6.18-rc1' of=20
git://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux
git bisect good c050daf69f3edf72e274eaa321f663b1779c4391

The first time I hit the pwm/for-6.18-rc1 it was bad, now it suddenly is=
=20
good. I am writing this from 6.19 and the issue is fixed all of a=20
sudden. The only way I can explain this is that some configuration has=20
changed. It might be that a jump from 6.17 to 6.18 causes the=20
configuration not to be applied correctly but traversing commits step by=
=20
step fixed it.

Does anyone here have a possible explanation for this? Since I am not=20
the only one affected, as stated in the coolercontrol issue, it might be=
=20
worth looking into this further.

Regards,
Jan

