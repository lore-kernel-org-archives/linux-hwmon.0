Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794338003;
	b=F+j4vOGFrE1ARA/sefzBwklUfiqLuIOXhSdfy8eXOQV2DXWxqqJFJab1NXXY4EQ1FRZH
	 nn37adI1z57yP62BdfbhhszuPoe90kxg46Z/A6NcBXYJd2rvMd7KgW/fPIN7Vpd7fEowr
	 Y9aSRDD78GYcxEN2P5xgP3J1epimmYgD4IbPDuAzrkDQHp0W05kKQOLQ3Cx5vXCNN/5F9
	 kyeQog22i6bvLodDvpJ4YKVfV2Tcm/iBLtmYLhGXU789rZqpPFJot2Jo+d46vrGrUbbuU
	 3tg2B+uJE5NGJbOrGuiJmRWv23ZgEvylqNWxLnlnFl7IWNxOFhHYN4xloK6jqoIKiFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794338003;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=78n6UfhdydErF/fIFRwA649SC+QhqwLT2ejKuFr0o2I=;
	b=fDK4Ge7w1SA8omfr27kJH88LIcpxKqM5J+0MK4d9e3tnLUM5ZWGkjbUO/Bz6CW9jjxT7
	 hGV6lzlzrCZybrdOvIQgbQvLKFyVMJ5/OaqUpgRHhSJWVNGto9Q+4YOlDMtgmWg+jx5ma
	 39V4NsFD6pI8ulEaALX/z7nCWpeX4Gd2QKJ78u2PGa8sggFzwBknqlh5wiwFQaS4bBxh3
	 OR2QXEpZHRqOgwhOpZN47bLU1ZqP+JJY5msGA4hzR/9y3hV8n9seO2rKdPx+5dGVX+A/m
	 d1DRC7YD/WxkqlVq/nSjp3pAyf4SQW6bGV75g8mv+WzlIjAAogAdOXkCPBRWDnIjwZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=W6qq2ZCt;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=R+ptMK70;
	arc=none smtp.remote-ip=202.12.124.147
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B92E606A320
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 19:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B92E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=W6qq2ZCt;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=R+ptMK70
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id BF41C1D0018A
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 14:13:21 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 10 Nov 2026 14:13:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794338000;
	 x=1794424400; bh=78n6UfhdydErF/fIFRwA649SC+QhqwLT2ejKuFr0o2I=; b=
	W6qq2ZCt0Mr++nk2DpJPdBKYhtUJKRKIYok9Jibq5eggZpDNJDCGqOCVGLDP2oGV
	VJXE1MJBHP8XTyxn5i1+iTSpjwIqBFDfv4gF0QSrpE6xl7V2GVIZmOHnwPXU36VB
	GJqW7P1jdGcpI/K6S8ibr73Cyfy2TxAO66Kd8yD/pZT62e3DaJr3AwAEHmofJJ4n
	EqHs8o9jxL1PX3zGC6tbQFSYyGLtA7JSl+wxCYfppEJ0GS+qkPnUvUdx1yd5zdOf
	k6xLyBaH74ldHcoQbO1l0+3V1TCuSGv4WlMG9+HjT7VJr9zPfWFzDMOufM+aH8k+
	3NzeUXvTHENy1a+Z88VgEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794338000; x=1794424400; bh=7
	8n6UfhdydErF/fIFRwA649SC+QhqwLT2ejKuFr0o2I=; b=R+ptMK70+LNxBzapO
	9fyztrWR1HT7LB6ecm/x+S6Up7FtvJ5WDqinDnvhXmS9i/mmpjDn70nsa5fdTb+P
	o0742yEWJm/q6Usuk1PMbxhomv7DlCjLs03lyAwlpIkUeU/4NTsltOGPLqncgiAT
	79Y5RdCy7ezYJttrMuoiaX8kguOQWKSWowhVGt6kVclxHOYJ5B+Mpr8g7ZXHtli5
	8b2VXlZADvLyrhFDrgV3rH+aKM3WBO0UVfMRWTBaiAf1UsA7jKSW/v5admZCIJRK
	DeyLM1h9Nr58gE1nWSEUZHFljJehyJAdhsz+h9pHALnRPwVX+dPYvNY1GyEAKl6O
	03Y1w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794338000; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:H7uAqe5XdA6xguBQkdkrZ3WdOqxV6UOFv3s5X3cdgJRiAlh
	/nzI3l8pNm1uQ06t4eAsAtJkKcnj4L/aTFRPHPLZDpj4yTeIozsSJW3MYdKynfQ9
	X3IZZDjAj/lOTjEawQoSErChQW7awHrgZ4yknk6XxmB1sQOJOKi73ORR+/4rkWhY
	WoZvgC4W2HvehKOizozZ2s8VSlYM1s2bbLTJOFf2HmNRbHud09IQOsLOtaaWkPQu
	L1TWmWgYkucT1cWkxImm8syVrXDWZICt0HcxgrKpVra/xA4F8PHRuvrF8E5s1PVM
	8kb8mtKyk1LYhSbaS8ahTHzMLsaQTK2m+6IUe4w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:XzWB8FiGzecA5oY1Zog1FavKKNKLSam9yPZ3rb2wCIg=:cqBg8CsqR7/56keh97/qMSFi0UA0fV92zWm0HwC2lBU=;
X-ME-Sender: <xms:zmzzaudMQ7ak7PJEYggLAswv0RWU7aemzU5y4fudcxFJycVzRVLn2w>
    <xme:zmzzajAcQiTGVEXRirQu9O4TdRJCj5S85EGXX-vg9MQorhMtBP1HPJ9r5IzP_cN5C
    pSsMtciOrrug_bShCuRGCtoBFNrvfR64cZX7GywzVptpG7jcU1axvlL>
X-ME-Proxy-Cause: dmFkZTGJ0Ls1VI2j0VXpEsq/SBddXadF7GTY+QR4scvueyniaDwagimxt4m6Cozm1nRzeu
    ccPDWNkGZ0RQnF5p5brkrHxHGIl5FUYXQmWB68J8GrjTIwF3BW99x1UrS+4GrUsnEoleBM
    gmwpNmGj3J0ANAeNU+zocyv0aDLLip6hgeLyH7sAEYZo3s4Fn5z8x0IXZvrHoRwlACOsXf
    aMBjEs0CFmmASilLX/zGX0CkkDCgzo7/9aHimUCVMIUyTA9Bntqw3tek/JzzZwmOEcCP8n
    e8UqQzkr/VCdKx3nlMHHbYM0SpBujNUajW1+tRrkYWdj9KfZ4togHY5UruecvCvIxP+hFD
    WBYBncbbqR07Y8yIEuuEy2W89ADlG/RFp3S6U1In08GcIxlqasdYkWt3d5Et2M3SqbSKso
    GUOuiq1ynXeD5QNgwLDf1HVIH6sJUr7CW95qjSVlwRfCJp6hB7xW25qr86VrrcCDThWvkG
    FxyIqDnlfnho+oYc40LLhUKWFGTgAT02jARCjPkKqAb4+sL2TS//4c0Elzu7AihOUGfyXg
    sRxlM6bMJIjlbcA34pxH2Fd6/lpBkwMs0FJGmBDC6Bn6cojWfvPNoMgGtEvBEiElO8yAGs
    TCUN/H6YNG2cLgUjfwjSSbwuMzwfKp/6iInRxbny619oOLGjG+o22/Sy/gSA
X-ME-Proxy: <xmx:z2zzatK7pkHMJnEemqkH0Oj36Zj9R9WBl2joCDl6Clvr0NxdqvifoQ>
    <xmx:z2zzanHtLipiIPMTypt_Y7aK-7p-PFMuxNCWOkPNLuv5ePCWGx0w-A>
    <xmx:z2zzatQcQetloEHVlyL-HZfqcnyynGmDWDs_X-ZJmDzFGhiwzMcoSQ>
    <xmx:z2zzarGpp7OP-DkGhXDwU9esLOEMN8ekEvz7kK606z4F4sqFfayREA>
    <xmx:0GzzajkeqvZo5hvLqGJTHT4rxBXZ3MqDjvo_ZQ4g3ma5HL6XUgBnZxv0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 0C15532A0099; Tue, 10 Nov 2026 14:13:18 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AZChSDJZ8IsR
Date: Tue, 10 Nov 2026 20:12:57 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Message-Id: <cf6c8c21-1d86-42a9-8b15-ac1d747ad4d3@app.fastmail.com>
In-Reply-To: <20261110183434.181711-7-linux@roeck-us.net>
References: <20261110183434.181711-1-linux@roeck-us.net>
 <20261110183434.181711-7-linux@roeck-us.net>
Subject: Re: [PATCH 06/10] hwmon: (mcp3021) Drop platform data support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 10, 2026, at 19:34, Guenter Roeck wrote:
> No in-tree boards supply platform data to the mcp3021 driver. Reference
> voltage is already configurable via the "reference-voltage-microvolt"
> devicetree property, defaulting to 3300 mV otherwise.
>
> Drop platform data handling from mcp3021_probe().
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

but I would suggest including this extra bit from my version:

diff --git a/drivers/hwmon/mcp3021.c b/drivers/hwmon/mcp3021.c
index d6b0ebf27941..b0839b2c2e53 100644
--- a/drivers/hwmon/mcp3021.c
+++ b/drivers/hwmon/mcp3021.c
@@ -183,19 +174,17 @@ static const struct i2c_device_id mcp3021_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, mcp3021_id);
 
-#ifdef CONFIG_OF
 static const struct of_device_id of_mcp3021_match[] = {
 	{ .compatible = "microchip,mcp3021", .data = (void *)mcp3021 },
 	{ .compatible = "microchip,mcp3221", .data = (void *)mcp3221 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, of_mcp3021_match);
-#endif
 
 static struct i2c_driver mcp3021_driver = {
 	.driver = {
 		.name = "mcp3021",
-		.of_match_table = of_match_ptr(of_mcp3021_match),
+		.of_match_table = of_mcp3021_match,
 	},
 	.probe = mcp3021_probe,
 	.id_table = mcp3021_id,
