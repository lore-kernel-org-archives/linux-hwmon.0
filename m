Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859FE1367
	for <linux-hwmon@vger.kernel.org>; Tue,  5 Nov 2024 04:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730779842; cv=none; b=NGyJ0p/gADn3BMOSgKfEg8r7pnhEbR6Cifn0XXHxYy9Az6t39V7O+cQ93O+cQ9vrW1T2YRqa1qzUqkH76pT3YV2OIV/JXA32OeF4x5dAHwsnfPUSOFyEZqDOLkPzE6RQePtGwP+k6AmaCXhh6tsgBmJgP5RG/pbCB815qZHUaTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730779842; c=relaxed/simple;
	bh=RJ5dyuCaHnEHxb2ODY/yWTobplceIiFW9Y6NsNace2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pT+4dsqU6+5RZtD4R/byVF4vdestTcNuKhbw2N0k6wjVFZtlmT2k82wm5dXA8q2OOciH8ypNED0jo2eAS9M8GmVx5tjLjgLhz1iMpMChXDZpImiC8fj2eCk62HUGc0GGBxZcrJbQq8tuxOEcVLDNILQNvudHVT+S4cfgEehUVP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=HqkqACsO; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="HqkqACsO"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2e3686088c3so3611258a91.0
        for <linux-hwmon@vger.kernel.org>; Mon, 04 Nov 2024 20:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1730779840; x=1731384640; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=scJvZT2Bp+kcd/IoGZ1ogwNGrXZa1xnJU5qHOxNFIJQ=;
        b=HqkqACsOOPux5BujQmtOUUZ6F3TzX4sJrmWMPZC8qsNn/TCXFp9cuFceIj8OddTvSh
         /34Xd15Qbm3jU/OVLDBSzx5DN0M/2xNXlmq7NGe4aWgrJHIOzpKD/UB5SIwjSjozc3JF
         ZJ1fPPVL1Hd4TRlj51T3l8TtOJcf53lrIEmpVVoOXSffoiBX62jUBXpFezsYZm5cZVrK
         wqGUftcvYRXON3CzU3zWgocTqfAQb7yaTxvp13WoVb6C75LGSmhdHDOzVy3FgNQaa9BI
         /ZnlFdSgskMbVQdSa22YCynVgvHQg5FPQg9RPd6W65h4p3zEybam2iUjmoeOApH/8qA2
         MUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730779840; x=1731384640;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=scJvZT2Bp+kcd/IoGZ1ogwNGrXZa1xnJU5qHOxNFIJQ=;
        b=Cp1G0lZ3tQagSNJBE4/HCB8Om/fCUnGAwmBtt60uFubNSv0Lzk8r5fV0TBui3HCcXS
         VfK575s1vBQ8frzEaraqzlB2q7lPz8ktt1KKYPQjBmEW026jlJPd04c77UCg+kQ28eWS
         hfAo/XhHIzhPzJeHEk4wjkNRWBkOPD3FUDvdCHRjfnBexkHeTYQLrMdmSxLGX5Tp+5nt
         ovLUzT5kSfjMFhqUppnzuD2UMdyxgVV2jbk14bQjhRKaZrE7Nh0FHYhq+GwkNCCCuyH9
         +8zwRJIlLaPg4L8EAIBOglAYOBbP6nV5VwZhQQ78BLLYMuF11PZnDIRCFj50oS9GY32M
         9O/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJacf4Ac5vTFVj0oHu0rudPAav2flzo7D9OejvQCoV0eQ/4V2KvqM+RIROB3YTQq0BbpikfqE+ceydmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvaTyAdv9dpgazF8guh8XbqCRpCqjk9z0AE5FrMPw704yEkfR8
	l+zLWX6cHE6XFr7t2A7pqpwgnYVe9iCqB95kNY5dO7A+PQU9yjE8TV2iDOryN2Q8ZnDeNxZGpLJ
	eFVtHFxzxSfyoHFULsjnAe/j2ka87lnFQSBUwTsPYxAQECcVWDeVGSQ==
X-Google-Smtp-Source: AGHT+IGScUy3G6UR8gz6wvjEudlraQqlt5Uia9jokVx/2PFVMQBmpLwbRPnyko1K4A9eB9MF28vFRoIVwNeA/WAajBQ=
X-Received: by 2002:a17:90a:6446:b0:2e2:b46f:d92a with SMTP id
 98e67ed59e1d1-2e92ce50e2emr23868289a91.14.1730779839807; Mon, 04 Nov 2024
 20:10:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104092220.2268805-1-naresh.solanki@9elements.com>
 <20241104092220.2268805-2-naresh.solanki@9elements.com> <ac9698862598f0d09d35872d0e091537f822fbcd.camel@codeconstruct.com.au>
In-Reply-To: <ac9698862598f0d09d35872d0e091537f822fbcd.camel@codeconstruct.com.au>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Tue, 5 Nov 2024 09:40:28 +0530
Message-ID: <CABqG17j8RhFpNV+nJ=nLY8+uO_XXjbN55+Ce8op=6Dj5Z=_WOA@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] ARM: dts: aspeed: sbp1: IBM sbp1 BMC board
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, jdelvare@suse.com, 
	linux@roeck-us.net, sylv@sylv.io, linux-hwmon@vger.kernel.org, 
	Joel Stanley <joel@jms.id.au>, Patrick Rudolph <patrick.rudolph@9elements.com>, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Tue, 5 Nov 2024 at 06:03, Andrew Jeffery <andrew@codeconstruct.com.au> wrote:
>
> On Mon, 2024-11-04 at 14:52 +0530, Naresh Solanki wrote:
> > From: Patrick Rudolph <patrick.rudolph@9elements.com>
> >
> > Add a device tree for IBM sbp1 BMC board which is based on AST2600
> > SOC.
> >
> > sbp1 baseboard has:
> > - support for up to four Sapphire Rapids sockets having 16 DIMMS
> > each.
> >   - 240 core/480 threads at maximum
> > - 32x CPU PCIe slots
> > - 2x M.2 PCH PCIe slots
> > - Dual 200Gbit/s NIC
> > - SPI TPM
> >
> > Added the following:
> > - Indication LEDs
> > - I2C mux & GPIO controller, pin assignments,
> > - Thermister,
> > - Voltage regulator
> > - EEPROM/VPD
> >
> > Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> > Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
> >
> > ---
> > Changes in V6:
> > - Verified all regulators warning resolved.
>
> How did you verify this? Testing the patches locally, I see:
>
>    +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: pvccinfaon-pvccfa-cpu2@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
>    +       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>    +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mp2973-pvccin-pvccfa-cpu2@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
>    +       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>    +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: pvccinfaon-pvccfa-cpu1@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
>    +       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>    +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mp2973-pvccin-pvccfa-cpu1@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
>    +       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>    +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: pvccinfaon-pvccfa-cpu3@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
>    +       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>    +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mp2973-pvccin-pvccfa-cpu3@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
>    +       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>    +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: regulator@5f: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
>    +       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>    +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: regulator@5f: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
>    +       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>    +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: regulator@5f: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
>    +       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>    +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: regulator@5f: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
>    +       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>    +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: pvccinfaon-pvccfa-cpu0@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
>    +       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>    +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mp2973-pvccin-pvccfa-cpu0@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
>    +       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>
> From a spot check, the warnings seem legitimate. Did you send the right
> patches?
Just checked again. They are resolved. But I guess the dtbinding patch
for the above warning are merged in hwmon-next branch & not in dt/next

Regards,
Naresh
>
> Andrew
