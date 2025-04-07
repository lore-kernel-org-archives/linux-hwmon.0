Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F304B665
	for <linux-hwmon@vger.kernel.org>; Mon,  7 Apr 2025 22:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744066214; cv=none; b=l40LIC6+VlOGc6azb9My7kiEvFWTfyI3ggh4u2HRZQFkqV9LPILGTDZI+DxVNyOQdPVWbLEja+zCuBaFVoBmyCjmCRHpJL9lYwzMsb/0YtYNpeXctFogqKrsvjJNVs7Eseu73SX4iQ6nG9hatm247lnvE81Bfd+V6afKDwwOR80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744066214; c=relaxed/simple;
	bh=8GAWzENHMPKfOQfDgRled+VgAS5+9Gc2azwWCta93lE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SF7eZZVMe8Lxjk3UUABA7QJZIxQQ/pGYyDzH0thuJcKH9PusBHQlHk9MyPwOGL9dvmIVMvXLD4PmYJ3WvGYGitFBbBlfWJcAdGD3DfixilU2Ov3R13IHaORFyYxUO+Jg8AHiO4HL00qCwSe+FpaqdBP40cq9RDWjoS59PEWTo4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c5gZpCOg; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c5gZpCOg"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736a72220edso5012379b3a.3
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Apr 2025 15:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744066211; x=1744671011; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qkPN/Cq+zsUIo3L1C0Hq+Zh5cCYoB43xlCPLDuPufn0=;
        b=c5gZpCOgHJ3Ci4Z62sdiOdwM6Oqxaqc+haU/lYy6+Wjo6q+5XYSltO4BGweJYy9s84
         vfgQ6ea48q7qL5UhiUSYZ7SiVCsuX0ND6eL6jgN/b11AhCz5mRnTiKHv58cDHgS+EWr/
         /O4LbmiuV8np4uXJTcRtVjc1fg3CeG1c0bYaMq02Axi2KxbxIroDGHMiTjOsikAZuE/1
         M75Cei7gOoMpKNMRi4ra89Rhfv+VL5CkyACrbw+4cWSJr+YVfmczbicOCHCKl6MqEiog
         jWIfD2Z1B0W3/LzKl+sla3RafyS/IJ/sz2rB0vyOSIrgY1un43VzIWmtyc+U1f6gWqwv
         hu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744066211; x=1744671011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qkPN/Cq+zsUIo3L1C0Hq+Zh5cCYoB43xlCPLDuPufn0=;
        b=Ku47V+zBpYOJsFdfYZ7Ya7JCNCdlb33WrNqOHdsC+kyV+owUpUw0hceBd5uwQ6tjTJ
         3c90lyLi0SsTqzpXTMm7swYYq6HAILvcJJYpP4tqvo4J4Mwu2hbxt1dxIhadrjduzgWj
         sPPxO3sjni7w3yXdSL+O1tqLoAP56pEnnxDl5C0WgjWfA6AbALbRFXuGPZogd/EUr+LX
         6bRPioC9jh/TCeF+glN5yQgsiZFF2baj0t+XRyImF5Xy8Px7a6Ka6WOQLRRNW6V93iTo
         lUzkk+vciW5wocJ5hT24bh5VkDyUdCWcJo6OjKrwhY0tsWrr682undjwT4X92+JsgNYZ
         GToA==
X-Gm-Message-State: AOJu0Yx1THeoY6TJr6xCepAdbJ12UYmmooZAefOKuzilFw4tsZL+XkPS
	bv2my6Y/3WJ5BDA/xe9k7kcHWCwEiab+EE7KWa0USj6p21UPGbyKawvMHw==
X-Gm-Gg: ASbGncuGoqEC7zKyC9prjFHBrDvZir0E3mmeIbkBuCda+3lWGIgeasV6KPk/Q2Ul1/A
	ixT4iw1h8pNfOy11SoAM5xLlcZOImp435wI5g0ChuxuwdYouitD5Jk4dCB9Tno7VN4l2EE9Yp51
	w+e2/Jx4W/eSEcV3LRM5h93TqeMcy0hf2pglobtcwPARamxBackiV4LkwTigdev0Clz/3sZgVsB
	QL+SfFjIceFvxSFN6l7JJtupv0VcaXjtacXO8buagD1C1wX423MkUmFuZ6UkqNyQzeTKMnk0sQI
	/nKXw5+G5k8yI2hbzuesBcAGtHrxlqR2dQkjNIe58DRpQmIHwcKaDIpuHA==
X-Google-Smtp-Source: AGHT+IGf9iB7pPwyO/emUMIBnJgNnchecq9dM8meOC4Ct0ylSGBeoqA0MtTFnrgKciB8qiTLkuysBg==
X-Received: by 2002:aa7:88c9:0:b0:736:6043:69f9 with SMTP id d2e1a72fcca58-73b6b8c2c45mr12217413b3a.19.1744066211589;
        Mon, 07 Apr 2025 15:50:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0e7deasm9408446b3a.170.2025.04.07.15.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 15:50:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 7 Apr 2025 15:50:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cedricjustine.Encarnacion@analog.com
Subject: Re: [PATCH RFT/RFC] hwmon: (pmbus) Do not set regulators_node for
 single-channel chips
Message-ID: <18251168-b9b3-402c-a810-0b8045ba1336@roeck-us.net>
References: <20250322142602.560042-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250322142602.560042-1-linux@roeck-us.net>

On Sat, Mar 22, 2025 at 07:26:02AM -0700, Guenter Roeck wrote:
> Single-channel regulators do not need and should not have a "regulators"
> node. We can not entirely remove it due to existing bindings. To solve the
> problem for new drivers, provide additional macros PMBUS_REGULATOR_ONE_NODE
> and PMBUS_REGULATOR_STEP_ONE_NODE and convert existing drivers to use those
> macros. The exception is the ir38064 driver because its devicetree files
> and its description do not require or use the nested regulators node.
> 
> Modify PMBUS_REGULATOR_STEP_ONE and PMBUS_REGULATOR_ONE to set the
> regulators_node pointer to NULL.
> 
> Cc: Cedricjustine.Encarnacion@analog.com
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> RFT: Untested. Open question is if not setting .regulators_node is
>      sufficient to solve the problem.
> RFC: Open question is if existing bindings (if unused in-tree) should
>      be converted to not require the nested "regulators" node.

I did not get any test feedback. Given that we are at -rc1, I decided to apply
the patch. Let's see if there is any fall-out.

Guenter
