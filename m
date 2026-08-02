Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620372F7F15;
	Sun,  2 Aug 2026 21:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785704614; cv=none; b=UTcWpJ3NPDXcuk3BEFIow59cJHmpODFJVlQMU7bopQUWZvMQf5ZfTKuUXXAzyiO1roHELmRyN6JN/S1MKTA9+aosZZ0gFS+dsR1ilG3281F1EEOk0E92SFiRYNkI/4Rn14W6A9HQvH7VVFgSh3+P6Ky1FExLBY+qdZirJX0jyqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785704614; c=relaxed/simple;
	bh=cjtpTBDbFyilQv6pO2FUFzmyN9G8BCYMJ0sCReT9QGc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jb7LGkc7ocFy18xXt6xrayMZPzfdIZ1WsQpJ47HfcNxN5hMV+OAao2700UMieUIojeSLr2AzTiwcGTea0wKqc+rn2rujpJKB6IfIGSb0Spuy9ua9PmeZ5uez+hY+d+ELGPiYF0Xq7Ja74gvThKpUPxFZhz7ju3AnO3QcVboYka4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=j.haugk@gmx.de header.b=P6V7xxxE; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=j.haugk@gmx.de header.b="P6V7xxxE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1785704610; x=1786309410; i=j.haugk@gmx.de;
	bh=1/sZKjM7VNq/1wjepDZ4BDg2Cymb/AgYJyz8pmqn0zU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=P6V7xxxETDTqG8otXrpbPXfvnSBaTLz2gEVIFeo5MWgJWjQPDq7VWF/YoSm3Argp
	 BUslVB1oa0dfrzJLSofnnqoYEa5UYQOX8MgWc6Dqw/IPoznRAD6+CuGk/H7aP5zsI
	 zJfZdavbD30Uwbt5odjgfXKn6US9XghgWNMlgQkZgQ6BiJ15bXn/jWl0t6SpAFe+6
	 Ukl4cHiYAL/bZ7kfk26577t+4177sXJn/rllhqfK37UGhmckdM61hkVLhR32/lqIx
	 W6+G262X4shAxZNKU7tZgNGMbrWJalBNlv9VFlh2tRIcLsyxyVnKDMMnue1y3mANI
	 2FkS4SSeZ6UdexA+hg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxlzC-1x8iAG1FNO-010S0g; Sun, 02
 Aug 2026 23:03:30 +0200
From: Jonas Haugk <j.haugk@gmx.de>
To: linux-hwmon@vger.kernel.org
Cc: pali@kernel.org,
	linux@roeck-us.net,
	linux-kernel@vger.kernel.org,
	Jonas Haugk <j.haugk@gmx.de>
Subject: [PATCH] hwmon: dell-smm-hwmon: Add fan control for OptiPlex Micro 7020
Date: Sun,  2 Aug 2026 23:03:18 +0200
Message-Id: <20260802210318.345995-1-j.haugk@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QMoO0H47pNCzOV3a5dKcS/2bEsXvEVJgyB+l2GqdkJ1tJCCS6t/
 QmBhoroK5omLsQtHqNID80Y+ZKL7xGmQ1snI8Nl3tS+vhvZQ57vWmHP0DlkJwrXGZA2ZlUe
 crbQN3wvLMzTSYTrzW26ppC7R3Ct90IEvcYUZBxl4p5b/3o2FvRjzp2apcKcSjeGYkX8af5
 q5ETQqdVSUavmZpApzQVg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XKAZGmTWJIU=;2QYrcLbEwLFR+icWUOVV+A3j6pD
 6ZCNdZFpbfSURnZLgVV1BeZJvWydv5QjDZ7rGelHNF4RFiPJDT8o2NPYIy39vSoBMHhDxkEyH
 yP55Olb/SEPNEaM9wsAqOCKrmqM14gMA96bXtQOtaFmOrqBZcGkCNGCPb/P60OAs+lYIf7UhC
 wLQ167vaqdY6VXdscnssWa9ylDZXlmbAw/oRHgBHqn+G+ONybP0WcPBhULJe2NMKsHD6thr25
 8SSBGRHOIZoRVmUl0623WsKa5J6H38AsJJri2Ufm1p1ilKkEd9CLyzjfgwenuKNVTl4dmOnsP
 zCb/RpVYDyTKU4aEGeUc0za3K4ndRAecBBRuWU+q0jwG8t/wivL64FodnI9jALeeeVT3RTZai
 aFY9u0584NNzw2F3kj1UdBofpK5J3uspguXoE1PIXcU7oki01HXKOsI4Rzyd8I12ORBjs2TpA
 vbugBBuU07K4hISZR9zIR7tSjFmuGtNU8VdV8Ki0LDVjLHwVFCKyvkONwZLSe9z+BvPWHW3if
 aFXe+iF83+n3Xy/UT/jP31L78c9VU5u8Y1eD60uwJwUtDAvQVc2tJBpyV+LMXIZBruhI+vdxk
 oaKBEzbf6driBVnzp9aECvC41IVG2/T6g72vX9OsAN+9ZIYIS+6+Nkw3NG3yE950dp28lQ+Zh
 Z+g1ZoUVyBrtYoABWsFGlBesl4lF2f9Z1JfhhOARHxtLWL/F2q/4httEei+F+6lUUU4DnZzIU
 GIEk4IERnT2wGGFIdWhUiWYbz+WNrLPDCenHClqpSUSKhadxzf4d+H9EyuzGOOjC3YExIM3SG
 TAqWrR48+D2VdNjLumVLfhq1qzLasBNft9Zd21xFDerjgsUo7r8HfcoervvWHpoCpIMEFKRoM
 NtVSEUDpWin79WaxAymAvZJU8mgVezUrD7bjktaN4cTDFSVSE664RNT7Idesxn2lZb4UdEPbB
 bnr8KpmzHD40vLm9haZ4mwr3lAA5w7LU92b5gf30CmU0AnZwIGJFu+jl11E5moFOVnrIyKs7I
 iLazW7pzHD+WVlCMNoYZ3zPmVAtq8AP7ZetmpK91HFXvQFT4bvyZu9yRloAgGzM2K7lgm9OQm
 ffYNLP0hPfgdwwPFiJk/ZSpYhFTxRr6FqDPWlD//FJuC70lT4SPrEtkoXFq7htX1npL4Nj7XX
 /xQGpXpNdt77+LfClxY2nYBOJC7uD7VMRw9fsNFTsFWd8wUFWMUPaJFo1/9IalXHe4wTROmSB
 Yhk22E/sBYv63u3BNqYOdpitRiQdgQp69zmb+R8nZ9B3eqT2/LPupipZs3V593fKXv84HtYIe
 Xh+kCJ6Fo5g2FOx83V4FLAKVtClJD0vNcgf2KylC45i8H67LWD2Jjkanrq5IFHgBtujZ+Nnew
 DYBRVNXxblhEhGCH/8LMCnlY5GrYLD6XhW1MZADSM3zh5Vf1j9jtt0kRM8zsHzxXoI2Reabbz
 arIPTiOduq5bgtRi9U1/bi7DeBf69FwKwyp/nq1YJQE/pwBSrpMEzxYTmYd3/s+0NRfvJPhex
 Np1MKnzQO6cwc/kUPWSdB306YmbNQ9dRrXsz1gRY0watBBTKOhgxj3XMyu1CHFTgvs/4ttTQg
 i+AnW3Rr9IyFEFh9BYVMpkcRiUS13RgbfGZserMmV1rcKvgf7/0SdPbTA//N3RBtLGZY5N+ft
 RncrTl1OfvjFyO1Fv3hZ6sJEBPqzlpfycOCoGu6x0FUfWOTxtQhf8EGdVZshPBpPPfxqj7eVt
 GfS7iRDNWHY5A+AYVBTIE0FM/n8hbm9DLm9u3HL1zPLSy71zUM8BkHoKC64xjTzXoKMf6tGlI
 POG3o3182SmV8JXQGKLov4WhRr+I6wwBP3EFZh0C5nz3d9WFXCUFhisI36RnybrHzm7por7jj
 x+32obFwsSjmhgX21yTvVIbv/0VTuCgPxbZbK7efK/IjIY6bV8sPVWnJG1kNOBnQxlGVkx0zM
 QbnzHGgrPE6P83wbBwYwFg9pQjBiXpuGB2Pc2JTNQjXMjZYmlrCdW1Sk8ABCzJbq7kVk3X4ib
 oOfye9GRkd86n2/9PCwUzVV/CnidKx9pxq9FbV9wDyAtN0E9D4bTSKBDTPg62gdE+w9MGglvr
 UdQD/TafYtr6APKGG9uWeC/azocYot4Tkv1Xh1REaFYEX+E/zVDTbBaBxOEM8s4QeibGIIJJQ
 XrKMZs5jgbRBqmV2qJflmBeOc87qiv0G1+FDkB++svG7RHH+S11PPxevPSei22PMDEkPOaLaG
 eGaUiWjGglIuEfsvyr3OFskBSfteefBvKL5qaPAHxIN0irwCRwfJ4yV7Jel24rHV9M5BO+4qe
 3FjT5p2IirH4sO3tF32llV8gGRIz2UYEOuTsIIHQJunHLfCKGaN5qS2WxlD1v4A/1peNvVyV+
 4VmgsjehtkGzhTAYSG43SUXgongupuF+r1p5oAzO5nEZjI5/NY2qcvrCDCi7eQe+kxP68bJB2
 wQR2KmVEeYSFYigz4NEf6mVynZamqfXyyJr7wcx5LGwh7tM3lucBClBQgFneGllOMECm/OnzS
 comNYLvf1ijq7VZkZP5tGjHNj+CWBgtFfqhGqnKKDOGItOs+lC/xAVNxulVrNtLTggQTkKfEr
 wACpNW9sbJLLn5vAzsgIOfqDQ9ZcDZnTX6tlNY8W6cfAsRnCEHPam1W33BcoSwMLfg2khFcgX
 MAWIAgCp90Xb2HQLQ1pgVIqw5rQgQ1+xuNusTuNce1nuZ/F/QDj4Edx6RfGziKiUI2q4egmXg
 GsUcYASoHvRzQUFQSagsoYjXGF9Fb3Mx4a/nnED9u7ZWxcNfp5/HD/MSN1GHgT1NEec6iSChY
 q0+z91s1Z3Ld7ThEdKAtlr96OCVhPDIDIevciq+fsDqW8fCZAxVI/rRag69abqwuJpHZwJyUG
 jOlxUu1zMXwDjVUwnvnE3Wh5N8/E46/GQkGS6GSDyl60vWagiy1+ytoPwnK1MtTSoRw/Sg3Bo
 qwmp5MmDR7eAf/ayeMpBA6BsdPkuL3oQUOMBqkF91SQjKEV3LNGcelankQwLCYb3qwfEmYX/0
 0l1ONfTjzf5schJBhHQODDZj8aGPKx0PdegTbO3Ud+zukkKt4XZUrnsJN+j1+5NTI0ry/9oa8
 2SV1n2awRrF0dxZMHf9MCz2X7PpaQFNu2w2MfyvyScY17NrYitNgJ0XK9hSomFGZf9PQk0EgN
 M4GsdCLO6UTlH9cnhgOy+Mf49NQACe8KPXgIz+dLzVme0YHZa6cOeCzXGVxyH9wfXHPV7HFm3
 koAOTtu7f7hdpYtz953aFZJV4oN0awKqqJP6D1o+vLEV3lhUFrgtKeTgWmflH+3IYiaBomxVf
 Qin1EvAE3nEoWIzBVUatkfJI5s2nW6ksqVGIRp05ro95uurMM3mvFee9waR7Jqv+xtUSfX7SQ
 bL2k9oF/quB0Zq3lJ6NjL1RPEMnJpdRoUWMvlaZuihoRghfR8tq8zHLXfNjKeepvUkjTB9wH5
 UwMbmcxTxams/2LS7r4EY1BkPJplJPVfLoG5v41jtT+enrdeq/gX8gpmMlGMqdBFuQm1Ij6Ca
 2Bg5fn/GBxCCyuH3oVK7scxyrBizYMgqGXmQcYqORTDsr4tSUBs8yt/5lNz81nv64tvybSU3e
 4BnYiqjekpRo4blEwN6gjjbhdEEe4mgUrUz87i/2B5ZEwMhR9tf9PQwBwbKx71o9oiKrKcQ6U
 ODeoYm8tSa3dt7lKeYdykIzF2Jj3qNCVS4Hr75MU7+Hso2+eqquMZjbTiYSE/JwjmulLDF7ya
 clkrjN27u38AlhM6Uy/qIlLntM5z2VEiytXnDaBdULbCG2oTi7POuguLvgb5Pvh520jYnRDkB
 mZkhgWeF3VRTZ812ox+l/x0dPK42wTBUGI3qx0qCj0XJlKPMG5UYWho/4UssELxJGZvZdQt4t
 2/Ys94ExBPIDNyf4eSBX1W50qfNc7jaOAypDE5bLlDsumv1RxHOQUP5vhrH64oec5MjeBQ7oY
 DqGcDjDWSayHX0WOjnRviqslyk0D9oG/MonazeZ5jAkq4GaSzoREuL4ZmtJbJp0VsxnS9iT0v
 4oiMrNTqgT4MzK0HF3bwjVq6wPOryjG1bM75UcWRMJ2pqzkmffcCte2d479DRxyIatisHR161
 z1OADW7P/YPEvuULMRkp2GZjEuoqU5eDo8FgB5oS7XICOc1/nVi/33PdHJT+iCuiaAgiCv7SL
 Xkh5zKcxi3td60ddbQ7wrekXve5ectabThwF8J9K46pR2VCVLEK8MBSDKt50ER7k1hE/fAsCN
 09/6HFh0Dp4sWbzj6OMjQf9FkaGqTQTRs+Yt2Zl3s+Aew0FII8/yTiqFglwCI+rC5lxEAnLW1
 CNBVSf1vpQPujdKJEAMezZ5Dt9fURcxBpzBUgO5jWjyM+iMNu0Ggapm4p8zC0OT0zB0tjv5Xd
 c3eiuJsUdYyXO7CeaoRWi+wUHXP3iBUWB36AMk9kAwIAX3yw2ztZcTQ8V669IVLomThrslk6v
 EpuHfZ7d4L5fmq9zetN2c10CrkOcvvTONRVDgXygduH4kYRbJOO97Dhsml90/MMHNoYk6JKOf
 F3rFnTO0qdbbqeCLrBo/DaCyM6CjpI+V2cuZYKaPRHFGzPeiHwgLc48rns47wjase3XMBRl+a
 +ffPwI9n8PWRZz+128hv87GX036GmCQ5kM7kpaAVEhxhuZrYiJQex7k0LEL9TzWT49eTrFDsw
 hB5MPa8zmDlCQvduI92+tqNF4KPaOEcnSlwDUs/VqmyQDlLQqVCjk25u5/lNb+uRX0z7vGO74
 cbf4r+p7CajHh2wAjp65lby0PbfGJuP25xCCc6xaqpEzkXcGEd+FJ5S1M/OqhReFDc0MstT/F
 PJv+fx86dt7U9hX62yLtGGxBQ8E4ycnT1mHLay8+ma6bsCpy/+LNd8RWvIr+APceKK364K4mq
 UYmSpS3TpG542iecgmZ0q1EBh3IfZ46TmOUhcHD7XFtH9GDIp67j79ubntP8cm6e2w6EG7g3f
 pSDnqte0EPl2rwiw4hLtA+9A3YnNbS3ZmwnLi1bM5DzPD/seA1Y0E2YFMpYuzOe88lTeSldXj
 uLrVFJeJriic3X2AI+p104Ho/Ol+mT1I9NZopbX5W2P8hDRO7qBWZ/1NqPyMxYMatebZY/lBX
 oe6uldCsAFuppEpBBhRPt/uRvYXMk2Pn0Yn4dSY9pSwC1yoh/2/vf6lfmJzLALo+sbReeCSV1
 aPv7qKTY0proLfo2+8xQwqFVztLxG7xMYuA8zqIEQLUcxa5Wu7N7MXsQPDdWSCnNa+n4tq2Nj
 xTWjeQutGtqmho5vpwIUDJRjh8rT5kxT0pnDVIkD2Ek1k48+nFpl88WRRe8gQ/56FM1G8cquQ
 bQyKz54XlUw3BvP4KCO+miV+kZWfucHexbqR3G5ttn2niiXzSimVm41bUqaTJJ+UvRw0jxdev
 FiKrbsMuu4E61lpFhGn9/FQFDYHH6e7d7/+UKO7qtqErbi/c8KeqVOTvMvDTm7gx0dLQMMRYr
 8p9gJ+0X0hPfuvsI2PJpmtCiOaXUl7qPTQLCxTqzf3BXi+KkRZp/SlyV3pch/5ohvvs8/vehn
 BBmzDm9Ku2M7skolhNJYFJPhv9j9WDnUMKVzMZ6oWhBk2Sk0WRqNGNsgi8Es6fM6Ru94anz7c
 2B+nMROM/V/LeioOqtmFmuthqFo1ljj4fKGYUPKaQRESO0f3gjVfh7diIAKmd/m8dcndUyrZj
 6ZFdemIWT1WCKXlhsFcR9DDLSoqIggYv7rnfdaVyMStpyI2n6UoZ77mhyW82mD5eo8inGrF3D
 XfnJc/r9t4VJoBy4RS7n8qBV4XQDndHW0Qvkw3Rw8yhC0Jb4DFdEbbbBrBJBpwKhnaaiQmXhs
 688UZrh6MjYyMF0iEJPe6bpMunI/3z+5uAg56kCTIlOAPj1NG8DD732NsO7iHKinLPAbWo901
 +Tstj5/czM3dvL3JAt7M6QEQeu6c3kGWOAzCyWqgXRq0eBJkBtE/EelA08edyX6mGsIL5hB9l
 MH25aKlE+ZhY6hMl0z9llwOh/TG7Lm0jkADZY=

Add the Dell OptiPlex Micro 7020 to the fan control whitelist using
the 0x34a3/0x35a3 SMM command pair.

Manual fan control was tested successfully with PWM values 64, 128,
and 255. The fan speed changed accordingly. Restoring automatic BIOS
fan control through pwm1_enable also worked correctly.

Tested on a Dell OptiPlex Micro 7020.

Signed-off-by: Jonas Haugk <j.haugk@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 20920d4bd..23773421a 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1655,6 +1655,15 @@ static const struct dmi_system_id i8k_whitelist_fan=
_control[] __initconst =3D {
 		},
 		.driver_data =3D (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
 	},
+	{
+		.ident =3D "Dell OptiPlex Micro 7020",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME,
+					"OptiPlex Micro 7020"),
+		},
+		.driver_data =3D (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
+	},
 	{ }
 };
=20
=2D-=20
2.39.5

