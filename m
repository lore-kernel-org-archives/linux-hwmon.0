Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF5D2DAFAF
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 17:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777743141; cv=none; b=U2tCA9Tw4hqrecImQ06Dp8IMmBPl2Xk5ub4JUXBbwsNnAsdWdqkUZS3NL/HqZpNjjDopLkoL89tqYwnXewy5UXIv7bA0LK4t1u5UehmCsAsViEH0NUFfZamhMNUtB3SOozp16Eb/P1FhSGo161Zg5bzrzkeKhZbMMhy/AFAjhCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777743141; c=relaxed/simple;
	bh=an33GoknQPZGJL41KKGp55Tt6Qxw7OQGojISJZeMnRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kTYgLTPwTQbG1Yo33xw+Jv/fwTVVZ85uzQ9FrzUYJb9VsBELRm4LrgsOAYVsvhKpIE2k9iSRenGI7RZqXQ7F497ZBJFCL5i/8geMvN176JdcFj3Npp4Djji/X7iNkrNaM3DsBou5ZKUl0eE2BmJXNRphNPyDuPAj027O9v6BFPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=YWV/yS9C; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="YWV/yS9C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777743137; x=1778347937;
	i=markus.stockhausen@gmx.de;
	bh=+MfCgvKcL5Ts49U2eiz8dEwdAKSCgnkmKO7l4SQwi3o=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=YWV/yS9C6yEMdSQ2YnEiYA8vQoatX1knHiR9vFuMM7+2srIdabC6vl/TxNc9MIAU
	 2E+204o74ByiHXMgVVB1rr1YGymzS521TMWNivwiwCQF1gYmzzpIl9zGQmKAnEXd2
	 iIC/BeNLx6Fuw79ODqHMgJkfdYtPfat/5dIgjJzhy6hiS9cNcG/GU2HftrcwI+eA5
	 LG2+QroIx0ECWMnEjBXSwEmeh9hJioUg4S4F3GyjVHFglphYfVRmEp0OhCqymoDWI
	 7wcNAFw8eYbF3N8YC6m3DzPZ42dYVvR34KnpaZI5cIgL+QO2ddicqxqgt/UUKGnTA
	 qUT+I576Q7HGK57Z4A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MXXyP-1vpHHa2qNj-00PIAC; Sat, 02
 May 2026 19:32:17 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	wsa+renesas@sang-engineering.com,
	alkuor@gmail.com
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH v3 2/2] hwmon: (lm75) Fix configuration register writes.
Date: Sat,  2 May 2026 19:32:07 +0200
Message-ID: <20260502173207.3567876-3-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260502173207.3567876-1-markus.stockhausen@gmx.de>
References: <20260502173207.3567876-1-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:r2PEXOF8E9hUyuTNo/9CE1JrZI3lPNA6UB8XJKp0DRohqqV5GB9
 8C0XnBMY06kq8tIQK1IXc1DcDT3MLbxwbixgTmrJswX1YbeVVkD8Ux33Qkr96s213POYGV+
 nfZ+mmp5XUBBiDQ8PiqrLO7Wvgz9PIzGDuDQSgAE0+gnhQn6vloe5mZ9fElh1JyskBD+gGC
 HgdS5DndDjpf62iL0duog==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yvadfePBgh0=;qYSKanEnxtnFIIPglawCZyI4dFm
 zpKvdhEmgGmzzR6Biu2Y/wUQZaGAz7kokLbB0Mmvg/oQudVM43KZCG2JM13ICQ65gDkRM9FEw
 vddvJepa3rNNwWsHxHsnEkCg1BRbzoMUsPoJfb4mnG/d4I53jCC+8+68YeMQDhlXAj7qVQdyb
 MsOz2kwyxGX1lnwmPUgESddasi2BzSmBB113MSIEaK7gZsACJts9b739lF6BqG8uAYyWXiINH
 bjAYgEJng/VmZJi9Omd5b4BVsvzTBTnn5PZ1KHqtb8Er3CDGTwMWIBe3BZHeJINqiGkKd9BEm
 Y6AASLGzicRDP9n7NyeotGs3aIDmucmTUmVOd1tw+dnef3c9yRtoBhnKisWkGHmbzLRalO7QI
 oe6udgbkF3AZrHQpvFDo+1kjdlYb+RXLghDWcbjmFqZjZsgR4TBMw6K+lv2kh44gq7tPLy6ox
 M6tPadtQkzDQLiKjLy6nS1gTbc9caS7EiEQqI7FiazTrsEe6mqvCr22Bfa2ABaCPxUEGOJWkh
 Rf+8hQhs0F5oeQvoYCQiuLQohpyMb8/8kpM9n2QXkvEugSR+1h/3avl7ik94cyKth/LPMslhU
 aYpONdu5yRs1hKo+hlNwP3t+g+7pILHrKyaIIViRxSh5c/D9xmtq2VGID/Ikx3gvczpR3hIi8
 AGq5dK8ATOWXiAWoQfSHPRpHQjF+7KZtanAPBRg36GG58HOYRX9rq93mRijRPd2Dw2xyxq67N
 fsLoKQfxTm1pgqlT7Y4eMcuyCNnQMO6XG9BoYJuL2/fZ5Kqvle8shOAn+zcTtAEjMQMf3L7Ny
 hI8M2L/gsPg8shtKm51saSMkaAQQtAtgHoQZNQo6H/ldyyYDYpHus61Q7fwWsJWqz9f88Mzdj
 oQkGoKfIHfQLSc5Cl7byyw8+NgWniW//SWDOHqdC64SvfGL++AYgwjoIL3YZP+jhkDDkdHKmj
 J3YzZ0oC8pvIzVywfG6CTaBIqpWuPZ4eF6pwjRN1VUl0lMiw+lOIOtDdTxEQ1t3ksKdqYPLi2
 jI8493PxQm9/RwseXLobzY0mMxYtETZtSSpe1oV9HfydEu65xhkc5lYEqbJOHMOShU6TMaxbA
 BtD8M+Bv2LBMl4yKiKyb+YLZSYlgwk3MxONhLccKym4a6+YBn7GnH7WzOAwReNVW0/g8+DuRI
 QsdkIcTinCivYQG8JgsnGUtUNbhGS4kiYUunpTEC422qCituqdzLOIKFSDJ+DeLr9txeADUi0
 rSpZ7vdV9YuX3xEeOdYsUdNcPf+5coVuueHGTNinjwuH++QjSxU0Ks5Q5vx9/ZfxYds4o7V41
 dAuNPJ7DNsPOhCHJLcpYDVCrCZSY0TtWSoUqOz3n6o9aJUS1TxdAs+QqmhXRvUYL9218PypGV
 FyM8qx59DPOYd+vdGYCC/8V0XDAU9FpmTpVMJUCn1dJMUhRPWUIa1rcQfa7wJoixJVJXQo63m
 GHdrN3oirgoIH+vjmuYRCStRWI1incfqr9MBfYNGXQg/ckqvJAeWGe2e69XYJMHPbmxw6izwP
 nNHy/85Tp/BA54i+AmFvMlV+3MQwOxkP9iBLyUsHs0ndNkvBhYa3EvBNHH3Ng64VUAqbCgMd3
 IjGBXYrskrN6L28ep9sOglg4EzxdOoQlyefImsXedAgAeqDjEoyoGPl4pYanVorpB+FdRJXU8
 hEZrkXXwcIyZgNBghfg+yCANUMFX7rDEB7DjRibZY5Re5/v/3OtFZnM1/v9MUrvp+6UmhOCKi
 wtsU3rq2rckbUggBxnxjluAoIy0JxEBoE+VqA3WqGe42eev+m7J499Sauf9vU6crNdiLs7aIM
 RrYFvDW8SDnw0k30+2i63eWBh0u1pU8i7e6LVR9x4Yo82Y6W0xKCbMslDNZM388BfbnQiDBqE
 u43wNLJ4EYfUcHrVt8oW6vEuq98+q9IltLDEKSGrw+igJ/GhlO87/NuliZGZdfFFwQ3SdrbrY
 lM+IrJ0AgTvfozf/BLyTdS/1b5ISERXO8Ij/5CeURUM/U6aFICTyfYRIIey1WUPm/eZ5bisiz
 6u0uG4dq/HXAfLAuy+P8faMCCX1ne8DcM64MmEIGJ2JjHiA39zIQMhSkxivOv6NBBuNKudVuO
 l4NgoXJqSRS38p4SNB5YDBFKlIRBuodR2Cxzb83YDoi6yhe5e0Hi8oLl5xC2y0ertCtKX/Yh2
 JpopbLUW5vnfKnUbEr8EeoeVEJhw6EBx8eumYzc2QSAPVJhX6weDMZI1H7HgW5eUy2AzQOq7q
 pcHjGItfq0E7X45xPY8n9X/Wic683VqVlygEeeFUgL5DBlx6gfZZFDpO4HLSSO4H/DHMpukEQ
 YXXPgdqLQ3HAJDHOu3lu++dHkA188v8FTtTDryivEIjkFB/mHwIsUH3wARNloqqmRQqGZ+WtG
 xqBnrN6u3P+FqPrQWB+7Vl50d3LY300s+pM9hOZ6CwESZLzrqBuy04KyY4jiUuw2h4LNEqkZR
 ohIF7VH3r07CBrC1LxgLkeYdqhNs+OAKsnNjygVqBRFVIRSlfeIQdpsU3QN+JeUWQ5sKFSByq
 tOp7k3cJBpGZudo6dgtuN/eBckWKUv8Py7Y+bdvCUtzZLlAkNjnRxAQq5w5riXKFYh6sBxBrW
 s7vebRWQsuV1SU8ReuXpTvMUVEX7pAyDr6/RXQAq8kuHrQYhpf2kCoP02fY8dOAS7aQjxBTzY
 RwYGSl9S9VxJyo5aS4TebIa61n1zVZS4dMgFukpepzCgB64CapeMrjEHIfp10j/UilXInJOek
 oR7zVP79O9tvx3I32YJSsLK4pGtzy6DxMEkfDZfS9GN5QpBKry3ItKz+onM8DAujsHwSLEYjg
 dlrzXuO6yrqUnxG8rOHN2N6GyrtzPyxtcmgYqV49n8Yb0cop9SjF8FMQMPLOR4aibR7shoGcY
 mAsrd3Zij6wCz3f133iKBVoqVGu/0mlHRAP0Svmsp2mMHSKfFQaAZ3XKuUbIgsqy04ip1B8pf
 TTPK4NkIaaGHNvVvivdDPe00Y8GZ62dtCxk6aYB9JbMfwRIVog/knt2IS1ttgneXC5t+KLXH9
 B5hezAkEwUjQKJPJoPstcZp88v6EX8I9bm31NoUdfF5KGwHPzDgi9dDnw1pGWc/WJoYyJBBmP
 0Kb5RnO86vYsx3SerV0ijeI/rRz2JTtqF3/7ksQm5jEBjtRm2iOlHzeQV6HY1M+T/RYWiuWYh
 Zl0hk/77CRrRG5GLjgSUuRoCXXmif+JbMPrNvyIMfRiD43lr3qZuz6L6b9vEq9k+TSNsrY2EW
 2IsK1Z4bH+15U09MtU6NX0Oc/oVSwgOKE0VMuUuMnmH9Z2yR52PhOwz2mqPaUUs7GBVeaMoN8
 QWKjTOwybGRz36MUyVz0ggwHTyF81Lfq4UDcJlIzk286hIRkdCWucX5TQv5YOGvPCvM9Lymae
 KKRsoPA/q1kTalM40JqfTh5LaRcXRhH1RsxfQ986kfaoWqjtwlwMjN2UFCSA7tEZUiAh2netY
 WFv1hlen5n+Oe89fU/1xN6Xsb3SQSE+yxN2pfsFhZ+NnkQBeX/v3fBr0ifv+69dY7A/Tgl6LF
 ELmBgrkUF1E8yMFswErXDURFfdAx8NmT8BG+oB1dVChOKbUi1VwkMqpmTocs9M9DOLWWsQeFW
 yx3GjPMi3yDJc797eQRkJcbbPbK3UYFN6e0/AyhC4s6PxVqYOsQb3fIywG7ZUw88JqkRURhXO
 zIQK5eOesdIwhVO9s0SeqvlYWMQPYS1kq36/f92Xs3TseCPj4uUIJWdfKxmjF8QZDJ07u2w53
 Xnf5XnpQTEV8APo9wFGmOVd89RukMhWa2Kx4I/rALckgfEa/Wdz2HETQzKeiYbHnH440higTy
 fenM1zkkuIp+tR9lJc8W/TyW7j0pnRNiIw1g2D8/hw9a6IvIXqcMw8XcQmgGx7bOVug7852zv
 JQW0m1QTQGD3peHFs4fXa+q9NZPqRsrgAQxV1RKmTv4XRJ9GJB6Kb9Gv0vyvyIoqW/Vev7CKq
 x5uQrikc5giWdpg3fqlKt4wptxTQpWFe/OR9Z8aTw3FdAxLxSTHXhG1PgeTzFyBaRtAGtjUT0
 tMFy4cvuh+OEYi3jRQrcvEo4RNXwT9dgBOa/Eka/HR4kgVQwBCbifuJrnUg9Xewq9mPlAXBTz
 3wPj8/kEcLuB8B+d/miJbxj7Fz93AdUL5cjw2GlaMSxK+wd+fRVJA+RmCZo058mlzVhxs8udO
 jtZn3k5yLcRn/TXTSiAaWIA7+KDSGw8QB5PeatxF+vtJQflXt3NCC7by4BXU/ozOBuStbMQmB
 w4JJ7hCxG+wpFt9R8fisx89El3+/OWRd2peguPFXISPlkMqgxQUkLw3GLaofLXnaivAjgQFIV
 82u9JdUBdZsMBAQ21uHVpwhroQL3j06MOjvDBOwu8aLs+SVfjMIwJ3/s74ilLyhkZ7FCKfYk1
 VnVQABUls8VLL8cuuijXUbqm2QYJ7Mmgc5L6nSXxTPyn+yeQfEmDDxw+WnSkcM4uzZLUBSWvR
 V3WeC4BP3xzT2CFZIrgJFoeQ94Hn5pCuqHi4+L+FgEB3+0awB0SdcU5ZeF0ezqg+ZtCZzfog7
 epnibvEpAO8vMlISgcXul41Jw9zJTSnFzDJtP8flpLvbfldVjEI/WoHD2XfYURfVJHFZpzEFe
 RpILZjK1RnPEsnGzXSJPJikYPkP+pPhHcETqB4fyZKqleq7yFsg/z9W1Fff/sIPtC844w4ChM
 WkyfZJczjm7WkLyW4OowOxp6dPfPuPK4qP/a8sVo5R0UB46b0cHwh1K15HnnVUZb+aLdcOcQz
 mlfU+3YHA1YcrutNDaAM4H138ms/tWtj5TrvXL3iPDF0BDQG9Jb/btJ+uGV6jsOwCUUdbKw30
 ZjlCBzYsY4C1JkSb0ZuOz+3sSgzRfz/SFlG+6fEJZAlhW0rtY9YT01H9VZPZnyiAkGOyz3xH+
 5orfZMtX6LLRjlGB9NUzYjJVklMrm/fKWARsct9WwUKLf+/8dhnnHEQtUQv91sXxL6wxM83QL
 34xJmwDopFkxJ81rmH1/aeJWN60VtZ+mn8th4V0PvsVU3ivpkyhZSdCGgpugqd4VC83A5EmSK
 rcLdm5xKc4PIDRZaRw6YMmtJ7zS1QHKY+5Nqn/FT+tXgSeFb/4zgAftTAoIa4DGcs5u8W/RIN
 MnGyd5CWqrEmjIl+C4kfaEFlmDg/JAwxTG4N6pmqG+wY2gDJlELBQsgmZkmu1JebNoctXZqYP
 K7WnzdXuuMUWoF8X6diODKJPZTvWHCJtWtBkKl/gCNfLy9qCLtYOdGeI4GL56H18v8mf+M6WO
 KDwLMeFa1PK5x/l2MW2z4YtyJIxhXKms/tn7xS2G+dpA+yKjtz436Iob+VpKZskmxjDpR6Yxm
 mp2rioZLMli+8cRvc5obP1+IXRSOoNdNIeRmEDuFGbhWUv+v1hZ44TeI51eefsX0Qc3OOGThx
 QqJpvT/QX6CuT6mCaNThDCxA/ufzDKzafje+zm11mS2HVNKXrdX2b5LAVJPRxcTF4Gz4X69Eq
 ACqBtbyJILSVPrw==

Sensors configurations are defined by set and clear masks. These
do not follow a consistent "clear mask is a superset of set mask"
rule. This relaxed definition breaks lm75_write_config()

static inline int lm75_write_config(struct lm75_data *data, u16 set_mask,
				    u16 clr_mask)
{
	return regmap_update_bits(data->regmap, LM75_REG_CONF,
				  clr_mask | LM75_SHUTDOWN, set_mask);
}

Basically all bits from set_mask that are not defined in clr_mask are
dropped. Fix that by enhancing the helper to always combine clr_mask
and set_mask into the mask bits of regmap_update_bits().

Fixes: 6da24a2 ("hwmon: (lm75) Hide register size differences in regmap ac=
cess functions")
Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
=2D--
 drivers/hwmon/lm75.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 7efcef7768cd..8b74cc314196 100644
=2D-- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -353,7 +353,7 @@ static inline int lm75_write_config(struct lm75_data *=
data, u16 set_mask,
 				    u16 clr_mask)
 {
 	return regmap_update_bits(data->regmap, LM75_REG_CONF,
-				  clr_mask | LM75_SHUTDOWN, set_mask);
+				  clr_mask | set_mask | LM75_SHUTDOWN, set_mask);
 }
=20
 static irqreturn_t lm75_alarm_handler(int irq, void *private)
=2D-=20
2.54.0

