Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793043282;
	b=1aCpn95/h7EIjgT1OjKOYV2j90KecyLr3Ny59ZFLJfrRUTyONXX5BCwtQ9qjTV4iZOzu
	 Qw6x/IdXZbRXuAMxkOBtrgD+pVDSRUEyYcBBL8SSpFIe+Cit5K2rPV7Kisc32jVFIolz2
	 vx2VwOrnBocyWm0C1+EUHb4r7H1IH7ZDQ58VbqNjEysG5J680YgkmKaZcFG702Ylm7GGe
	 dckRvV3T/odGqEiPJM5Kp5ZvacsDLQO/JykaSw5rLz2gAOyvloZPlgoM3Rb1GD9oft6TB
	 9bln7jKEFkX0HjBx4VehctP9b1KkhDhJ1/3lvWcd3juHe+rQ6svhNkmJe6Mj1ExiMHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793043282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/bOg172qvoK2vBZVrivb8+YYVVMqbz8lqzV6ETp4EkM=;
	b=hnuOEbpG+5lu1L2L/0q5dX11iw2SVRJX3FncTnnhhFiUDEytNylkDYftrpyVz+g/hUpm
	 2LXQLbGqiddAyE7L5fobqRtEKrtpxKmw7kWX7thte+kaquH1Ec+LR70ooN1fQvHqiKmJE
	 uNZhGnUo3QotCkl3NF/xR/FkIm5UVzo3oUPi56WJEm5E9IIPbLcaNzVEoYd2/M6kmH1k/
	 dC+JBk7jpW8h+NzTkrXc/H3T7Sp7pqulrSkF5P4N4eqFQ/z0/M0XK0tOVta4CMligen2X
	 CKdgC1EXTpNWhpreou7YrQ8a1ILhjvy8U06EWcsz1eHyQBV6Cr9pE0L7+UF1T2Dqp+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RuRfJHp+;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFEC606A31A
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 19:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EFEC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RuRfJHp+
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a3c08d6928so446695c88.0
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 12:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793043281; x=1793648081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/bOg172qvoK2vBZVrivb8+YYVVMqbz8lqzV6ETp4EkM=;
        b=RuRfJHp++4R/XtjOKSXOyDJBiRNjHMOSB93KiHtGHNT6BzG7bD3pKLL0cHUgn2AqDG
         MlUMzZvNPXc06+5/XWy6nYtG7v2ssDUnkOLk10DnbvwEkRUOY3QG/bpYsCeSklT939ns
         hW2xIPzHbcK+nUexKLBot1+FZvrDZXa8qV/1wA9RGyQsWHMw/G57d/IuafPXaqU4FAQl
         +KmmpGtgBVZZ8c5d/W+ZrZR+T/8dvRmFbI2Vug6bT3/GGAlUCH/6LLOTf045BYRH6nX6
         cTg5rk/fuFjuOebkIwcf0/xK3JcQQ3hKt6qy66/fRmS1acWxTBPqDlMUBoJss51xyk/Y
         d7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793043281; x=1793648081;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/bOg172qvoK2vBZVrivb8+YYVVMqbz8lqzV6ETp4EkM=;
        b=LVlk8Q3O9ymHQjClzCd5P0fCJnzUxuzhoUeFV9Akrl1dpaJzTzA+yKKDObJ0UfV1HM
         HEdQzQ2mJ4C7MOTErMg0LxHsmgWMhNQit9XP23iGyFLojExG3cqJaEz/vdyV0AiRvAmh
         SFHsE3OZiZScznYODZl1wMTgWNBM0hkEXKS+ftEqKsHOfH/sTYYXEeraVKu/PT3vdWPo
         9E/kcAfXk8oxyp0VYiwh8NaD4oYbM8mz2r3DBZ1css7iVi/VNnOmLySU9r6xWzdAaZd8
         8n1mnNYrFsZ54S+JfKlCk0PpOPQHneC41wikFES5EhKXclVB/TPXYn4Rapsl/izlz+Wo
         qRBA==
X-Forwarded-Encrypted: i=1; AKwUvBwdO3g9HWAdBoVsXqOAQuTuER1EM8shxe1BUYiEn+SKpQ31VnFZsfuvsmjUktmjeneNupw2CyLyjQ2nQg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIhSpNKSSA/Sj1M9zepn3qEG+XbQsk93lRdbRh+Bj+ppnPWfCLh
	g1eUKoClJy718jl23EJ3M4BZMhmntiRZISZrFrmbjmXdeMsmxA5LMNII
X-Gm-Gg: AYBFou2vt/GJUUSJbbHLPhy67WM6jQcTVoHiZvy44S8LcpHbs4TPLBHAp42RUnjlG3O
	YXa1wy31rouXhj4kwRJ3B17xFnDEw/4sRbWkG5cdlsBbgO7biJh+02NV4dGGB7vKgcmCdOup8pF
	bF/Tk6GmHLrCXEGGKr7X7nG1xfFYYiOreonPdUiRrNyDGsonyqPBrKmRMpqagQjy/wrOcuyasZj
	vv6w1QhtbDqe+2gy+TPSgwQRKF/qi5bFthYFfTJmQukCmT8PQ7FAlE+FQCr7vt31wCRKBR3J3IO
	JSxVEamugqE84/czoaMNK4bJGuNlQ7apY7mumn8bEZFLBAwZ7361ArTh5bb/A226GYSfT6hVW1B
	JIHRoORt+qzi8yI5xr4N6X94rO/8DXf254CpUSLkiyNQ7qlA7CwcN+c+u0jAeLQlaII5Ea1lqfA
	5+uyiLtc6JtGJFMPXpuZg875wc0oNtfYCka9bybxuX2d11U3qvQcuoqbzqfiQwLKXWbCi/aD0C9
	b67AQUwZ5xOzG7KfCutv+B9gAZD17g5rMi1QHfNy8cBx1Jhs8ACkfgxMPo6J7RnpUK+vw==
X-Received: by 2002:a05:7023:90b:b0:144:c128:4c4b with SMTP id a92af1059eb24-1a13e289594mr5176975c88.36.1793043281360;
        Mon, 26 Oct 2026 12:34:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0d98660sm29595419c88.9.2026.10.26.12.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:34:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 12:34:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Remy Demangeot <remy@demangeot.net>
Cc: Eugene Shalygin <eugene.shalygin@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: (asus-ec-sensors) add water temperatures for
 MAXIMUS IX EXTREME
Message-ID: <0d22ce1c-c521-437b-b4a6-14555f630d26@roeck-us.net>
References: <20261026-b4-m9e-ext-sensors-v1-0-644d389b2de1@demangeot.net>
 <20261026-b4-m9e-ext-sensors-v1-3-644d389b2de1@demangeot.net>
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
In-Reply-To: <20261026-b4-m9e-ext-sensors-v1-3-644d389b2de1@demangeot.net>

On Mon, Oct 26, 2026 at 09:57:37AM +0100, Remy Demangeot wrote:
> From: Remy Demangeot <remy@demangeot.net>
> 
> The MAXIMUS IX EXTREME has a second EC (firmware ID "RGE2-Z270-0109"),
> not handled by the ACPI EC driver, at I/O ports 0x68 (data) and 0x6c
> (command/status). It uses the standard EC protocol (0x80 read, 0x81
> write) and the same bank register (0xff). Its bank 1 holds the water
> temperatures: WATER_IN 0x0d, WATER_OUT 0x0b, WATER_IN2 0x13 and
> WATER_OUT2 0x11, as signed degrees Celsius with -60 for an absent
> probe. Water_In and Water_Out are at the same offsets as on the AMD
> 400-series boards.
> 
> Describe registers of the second EC by setting ASUS_EC2_BANK_FLAG in
> the sensor bank. Banks are sorted, so such registers are read last;
> the second EC bank is saved and restored like the first one, under the
> same hardware access mutex. The I/O ports are only requested for
> boards using these sensors.
> 
> Add Water_In 2 and Water_Out 2 sensors and enable the four water
> temperatures for the board. Readings match HWiNFO 8.54 on the same
> machine.
> 
> Signed-off-by: Remy Demangeot <remy@demangeot.net>

Applied.

Thanks,
Guenter
