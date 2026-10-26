Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792976508;
	b=t7E3NFj6iPDbkv9QYscYg/OL1IN19jgM/pJdjuVBaJ+FDka2dCn4h3oXB5FQJiZqNv/F
	 VNhEvSJFKQ5V+daOJ9I+M3VcAslh3Tia7cbDnuGAx3nDfkacue6rdJcPLVUE88NmoFoB3
	 ckKhH4JnIJGVy0AEjvlQq5E/F4RPjzdbdYOLaBQnf8huqdp802igrSMNtxFV12GZZfcJL
	 9hjA+WwkKIOJqS+YbfP3vcDZtFitfoGCqn1VsbcEksmkBip1v1cCYxzdqPEFbDBCyUIu+
	 onMZ4ZerPxKRCeN4udIPrMKI+tNXkUlQVPeOV6Ab2wbXsqfM3qQELEMHKD+jDQlc+8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792976508;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VeZPXDm0RhtGiOKTO2xKl1A3KDZM7VNOTwEX394Zg9c=;
	b=kRxvGo9a0fprPtW0UN7KvodOmw6BwhNhq3+x5gfBLSj5rw8FFTYBm34Ps+xsBVfNxRtZ
	 7I8d9d/Z2vgqlSqKO69omlIH7gTYXxC6cWzuoVv0FSmXxVe0YU1vsYsJ/gwUhh3iwiFys
	 mIol0qeBy9Tazs31JPMwQwarzZ8rInHX9WSx7IZgk7oIOX4KPTxGV1A6ly2VhGcVldRYQ
	 rC2WrR2/3QdaV1AMZERMrBeoyOaM002Zy67drz7mfq0hHOM5fq/U8TRf+zh7NG3sg0xj+
	 z4pOo4KzHErupTdjAwpaCUBgg7WOPHRRzuUZu6P67X14u64swMpIeJPa6ig/mrEFZRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kesbnkBJ;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1593606A31D
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 01:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1593606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kesbnkBJ
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so526695b3a.3
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 18:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792976507; x=1793581307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VeZPXDm0RhtGiOKTO2xKl1A3KDZM7VNOTwEX394Zg9c=;
        b=kesbnkBJUvYzphCkzZljvgMUBw1E06XWOAD40PUeR5WSEw8f5QOb5oeqUFKJDCRJG9
         yhVF178AgwImYtHmpAEKXvHVphu1ZGmSWSRrsYI2ORSd0HLi1vPcAMQwnSGS16lHAlSf
         MYY2DGatfnLI75aO0EyiUmHgyzBzkJIg4iVMaTGSJ+bXC/6dCt8oBdnUkVPQSPjiTM8p
         X0viSroGrckqS+rov3CRMIaaZ0HIdYA3aQunn68nZT2xkedbzpO8zq/aLIhN5KirLjT5
         9rTyCnqnrA47T9HlUgzymCDyhYr3Xz6Nbn4AiwYE8KRLk6olcMMrC0W4/71LGf3zwL55
         jvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792976507; x=1793581307;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VeZPXDm0RhtGiOKTO2xKl1A3KDZM7VNOTwEX394Zg9c=;
        b=L7Zc4ZkEnxGELc/lvY3gqtR1ACTecFg/tHVGUU/2VtaKd159ndoarJT18SEfW9rX0g
         knrF1JSYclP/lmWd1nQjqb/OFeDLTdDj7ub0taUnTZ7vzCOTo1nVPLvVDO9zTSFMVusA
         sOUOtBD60P/ByMnFMSB2m+zMNDxmuVss0DtpK3Klc+xeNke6MV6gAu2FploSqej/4ly+
         f+8uDh4My3XLwa51GNoREIh5pHAayYldm9VX0XZg8AvyCotwIbOMMhO51n4WqgRdCxUv
         XtCPJiN0OpuTIZvMgaSv/lztt+AF/7yWldQVjqpbpyQd/z+UILIzGFqOLoR/ITCgMHgm
         V57Q==
X-Forwarded-Encrypted: i=1; AKwUvBwNZ4d7qW3COKG3VY2DpRAo7p1W0BNLjD0nFYiVFm1s33ga8FmHGhAz5Atybjhxet9IUeds9khb1j/1qA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLeRE5mGOS52XhA9AK2ogwdrLp2Tq7fw63iCxt2dL8Q2KgTVtib
	EENz9EfUgRUoaiTsUN98Z7oYd6TqYmX768nTFNxEzWnqAAZ2OQ2tL6/e
X-Gm-Gg: AYBFou3LKEHPSBTbXV9kz3MEej+Nir3o3PW0sfj+kDunPpculo6Y+7Hp37cDu9TKs2v
	oP86ky+M4hQ1hV/EvDEyWIT6LEoef8mi6AcNQVRIpPokn9K/yq3zC2dHiNnnqVoqIKw5KpCu0i0
	sM4YVkFjNbdH2lxiFj9tSqdB5UW8gmFtprCuUGFIrWG5ugF96J/7KAA4xTGWYNgCSTFngHrYiN8
	ZRiBqd2tCjIiF6u0+H5lANkXWVDLomfQROv2CWVsoej1isEm5CxIkQxEyEYhZxZLEKSRnIfHF0I
	uGdZrppgmarchf1xhkg8FMrewBRiKUzCr0DH+0DH3wFYV45S/twEpGj6sV0HanNExkVKIgZR+0X
	+p+fKxBO5GN8vezo1xxF6fMAuxT2oTCOp9iA9/3yx9/YxA0TGBD2LQ2/JxcQlHI+r+KENFhIoHd
	KqTiAkKWs/5tzh+Al3+HE/Ifs33DT3VQfqBjsSzY6gaDZPC7liacv/qnkxtGIKoM7zNr6ZYxw5v
	c5cTWY4nfEOqbOsDLF5GTFNlieEqieG0OvgxgtRot0Dxro2CU4fI3/z5RQXt36beB1zAb3Qlo0d
	Wwl3PLYE0xfxK7A=
X-Received: by 2002:a05:6a00:2e9b:b0:89f:6989:cb9b with SMTP id d2e1a72fcca58-8a3686bf26cmr4112884b3a.27.1792976507110;
        Sun, 25 Oct 2026 18:01:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36c4e8616sm830722b3a.56.2026.10.25.18.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:01:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 18:01:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	Eduardo Valentin <eduval@amazon.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: hwmon: pmbus: mps,mpq8785: add
 #thermal-sensor-cells
Message-ID: <cee14239-74f2-4fc7-8122-cd1df1dfbf84@roeck-us.net>
References: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-0-bfafba9fcc95@free.fr>
 <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-2-bfafba9fcc95@free.fr>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-2-bfafba9fcc95@free.fr>

On Thu, Oct 01, 2026 at 11:47:40PM +0200, Vincent Jardin wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> Each device of this binding has a single temperature sensor: the
> internal sensor of its die, which the device also uses for its
> over-temperature protection. It is read over PMBus with
> READ_TEMPERATURE_1 (8Dh). The sensor is internal, not an input:
> none of these devices has a pin for an external temperature sensor.
> 
> Allow a thermal zone to use the device as its sensor, to monitor the
> regulator's temperature. With a single sensor per device, no cell is
> needed.
> 
> The MPM82504 has four channels, each with its own PMBus address set by
> its own ADDR pin, so each channel is described by its own node.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
