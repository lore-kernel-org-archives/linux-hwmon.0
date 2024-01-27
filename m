Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8DD2560C
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Jan 2024 15:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706369980; cv=none; b=byKDonICQT2M0Z0u9n7QRCiBloOktcI+PpSW4Hp78yupIl/OMcifxL00MkLy4ybyEYhoEhR3ndmAW+hR15way47+73eI0jZmo/dCVL/zylI0Mq/7PhyNwic43xjv6Kz80mWnmlx7wqjCgC1cpTGdytJll1mpyJVSJLZNvA7ruEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706369980; c=relaxed/simple;
	bh=M+2bH1Cc98Z9FJtoh3PefB3uhd+9VWe5ERFwZH2U4NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=blhkeg/9ihJazaotvZLDin8xgjYKoZMOb7KVx5LlQUuJe3Sb1SYL6kyJxIMNJ1xd6FLn7HDUAn1dz2BeD+bZI2pimIISaW40whfVIHz63oUO94LGqkA3gxZ1jTN14w3ffq/xhTMpNZQPSpykwzXaBtbpTOSNrQ0gNYa3WZ8C5J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZF+Fn7Gi; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZF+Fn7Gi"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5d3907ff128so1222781a12.3
        for <linux-hwmon@vger.kernel.org>; Sat, 27 Jan 2024 07:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706369978; x=1706974778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bjZr33ooT4EvX0FKkWGKRkyMS9eWd1F7Z3fpKGZwCJA=;
        b=ZF+Fn7GitTm7KxlL/RDFRLgZ7Fd9/rfGaPLFqrzToT6h9F1AGSI9QdTFbPXEBdFJX/
         xr4npFi3+XuqSa6yhxRjR30HX0qKTc10+ejnNhyMHg2937FWw2VWXAp95jCP/YArGqSI
         3fmR+g2GLfCjl+/nm8nmZSmihfZFxylItcyRyDMKPO0n0n6Tqh7tY9UIycE2gfnCG2NT
         VLHzeIT2bzYXttiRvkHl6q928u7GR5CSqgLRsZGvt4Wxre0lTeGWckR5YBBAG9KYXfnq
         mk8ahhgTk8nAyjJ/HmBdLCcMXMW9Ed+KIrG4A5COYhwVWQpGJNR8X/b4Fn1mUNbc1B8A
         EqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706369978; x=1706974778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bjZr33ooT4EvX0FKkWGKRkyMS9eWd1F7Z3fpKGZwCJA=;
        b=OU7+1p+6wC2+uNcl1nz/B3l8nz2eO/OHEXAOrWzz3PN9c3T+twtN+C2sDi9ElB27ix
         gy7sfjAO+DuLRbrbeH44TYfZCG2L2eAg4LAbwMmVhI9YlR0h8zQVK0kHprgruI8Bs1rx
         33Tic3tm9yWjBSiVdrzDQXRtoo+pUQoUpLt53aC4zKAmitrgog5ifz/u7Y6zHif21YMm
         D6EQ23y8+SRWWNPKrCZrf+xA12cPrXIJqazK8Zz+04oanG/lKNMcX9isk/wvc1rjfZJd
         xeTroY/UVx0Qxv7sFgLb5cNke+myoJbZ2+iDvUxb2xXH1iUvJfmVuwlTvi+Q1OkJns08
         QNWw==
X-Gm-Message-State: AOJu0Yx8ee62HCLjNzg7GEM22WKRpbtIdulvmu3tTpHJKVjPtqhbNt8D
	k9o3IDrZNuLEGC4pdOn0b+2+525KR/64AxxRc8SGGXcLXOMAxrQFg+KEnX0a
X-Google-Smtp-Source: AGHT+IGQqBo2fzH661vMoF0OihpyBwAEB8zkbOQTPVzUDa5mmXneyDp1Ar+Xc4kNw4aNsEUHZ/ALuw==
X-Received: by 2002:a05:6a20:d388:b0:19c:9b20:c9cf with SMTP id iq8-20020a056a20d38800b0019c9b20c9cfmr1494417pzb.81.1706369978198;
        Sat, 27 Jan 2024 07:39:38 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id gx20-20020a056a001e1400b006dba11edc7csm2892440pfb.218.2024.01.27.07.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 07:39:37 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 27 Jan 2024 07:39:36 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
	Jean Delvare <jdelvare@suse.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	Daniel Matyas <daniel.matyas@analog.com>,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: Remove I2C_CLASS_HWMON from drivers w/o detect()
 and address_list
Message-ID: <df9fa016-413a-491d-818e-b429b854f633@roeck-us.net>
References: <75747c6a-d414-4b07-8f66-5a5cdddc3c36@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75747c6a-d414-4b07-8f66-5a5cdddc3c36@gmail.com>

On Sat, Jan 27, 2024 at 04:02:54PM +0100, Heiner Kallweit wrote:
> Class-based I2C probing requires detect() and address_list to be
> set in the I2C client driver, see checks in i2c_detect().
> It's misleading to declare I2C_CLASS_HWMON support if this
> precondition isn't met.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/hwmon/adm1177.c       | 1 -
>  drivers/hwmon/ds1621.c        | 1 -
>  drivers/hwmon/ds620.c         | 1 -
>  drivers/hwmon/ina209.c        | 1 -
>  drivers/hwmon/ina238.c        | 1 -
>  drivers/hwmon/max127.c        | 1 -
>  drivers/hwmon/max31760.c      | 1 -
>  drivers/hwmon/max31790.c      | 1 -
>  drivers/hwmon/max31827.c      | 1 -
>  drivers/hwmon/max6621.c       | 1 -
>  drivers/hwmon/max6697.c       | 1 -
>  drivers/hwmon/occ/p8_i2c.c    | 1 -
>  drivers/hwmon/pmbus/ir36021.c | 1 -
>  drivers/hwmon/powr1220.c      | 1 -
>  drivers/hwmon/sbrmi.c         | 1 -
>  drivers/hwmon/sbtsi_temp.c    | 1 -
>  drivers/hwmon/w83773g.c       | 1 -

Applied.

Thanks,
Guenter
