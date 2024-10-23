Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0711CACF8;
	Wed, 23 Oct 2024 16:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729701640; cv=none; b=IHqLZw2h3dQHKyH2KXiycpz2Mm6WpEBCNbQhYNICVyjrQ+wzgI/tmvibOK0hNCqdVXiop6Po+mlVi3u+2T+7T1YI1Bb+48fOjGjxR6KrSV78CUGTJRGxKPicQJ3eZ+GxjG/Gw8ws74a7hn6M06pygkaMubA2yRQhv8C/XPEAgq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729701640; c=relaxed/simple;
	bh=54QGwWlNRFN6JRrsvG5D9gz67puEZndbnNc4eG83ao0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6/TEYmqS26oRlrxcK4lhqwYwEB6Ah6fDd59hjhHs2mYghLqENkoOI+C3qQDa9EFXhrOFinMdfEAp/N9RwXbtHncjTXp16sX+c3ojhMkFXlHHyd+O5DlDHQVwHhEivPvHfFzEiGwF4ETj0osn+d6Ql6ZdpfXhBwaAoLUhZk2aoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6ZgyLOH; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6ZgyLOH"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5daa93677e1so3506336eaf.3;
        Wed, 23 Oct 2024 09:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729701638; x=1730306438; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cFWgZPf+2ad6ln7/uArQuwrcvBNTfdTOyW57F7DPrSk=;
        b=a6ZgyLOHHX5E8qj3IZ6Di0ppujx2Xhw4WtlsOwj+yHrU4RzDb9Zwz60buQlJWebK+R
         sJi/4C4fLjaXOkjrbM5OE46tou/lQXTjECKnkO3AP0xa+lJ3eVMd+1VO17T8c6IZx2v0
         oPHNw8dVfBv89ovlii4u0fifUtx5Px2YgYNMoMmTxkmpai+Hhxmt+HmbhyFXmCnXj35X
         xPPrwqoBj3IUzHvb3b2noTnnx9c9BdtfOn8VvMwei7b8nXJpQIljSMH0cRvX30mrsoLw
         hodygXCQMoqccTsgxrDW65rt7fGr0/tYOU6Xhpj3FxdDctzS6h/uuB6ZQseV2HF7NFbe
         T3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729701638; x=1730306438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFWgZPf+2ad6ln7/uArQuwrcvBNTfdTOyW57F7DPrSk=;
        b=kxHCmWkoQUqgFE+A5S5YRNxNIY4LRXS+thNyN7CYAYMLVF2xSfQnrD/RMBtU91KUGQ
         qNbiy20UU7IbS24izRhRlalngwNdwUeU5Ra6IspaREIIvYb0FVWELUw9ThVEfafnXkIO
         laDuQktv14AmuqWjYoyPgDNHyg/d9EQkYb8f0KJvR7oOAiKuEZYxPeXoE5Edr5hX8q/E
         FVstphjc9ZvlvPd1BT4pSBOgX5geq+XDUgAyBGTjUxLiDDeXaHlhldEg4eJmsthj8VpL
         E0pY64wpSv14Y7E/vX0kihfGUwWHfbEIm0talwceEayzt2XFFQ93nLgA5KkLCPFbTABP
         tZsw==
X-Forwarded-Encrypted: i=1; AJvYcCVZUtbdz1uKEf1GK4xvs1A7bgi+8JVNPPeWJO5nLPTH0vhgKE3tQ4LsOSe9qTJtcvsH6SgrKta3zy5w@vger.kernel.org, AJvYcCVvJMzMra3CVqXkxLAiKUFAjqIMKkkdHOj1YC7nVeblPZiFZomK7bji4fRYYueh2mJ75EJWvfoXLxdd2IM=@vger.kernel.org, AJvYcCXp8cB1y6JV2trgCYgejXT1FeqndLYvS+6keVWTEyXNoXCrbdoWhVFtB1DJR1uFm+AbF9PtzWr51Km8@vger.kernel.org
X-Gm-Message-State: AOJu0YyFZZ4LaVAexruS4eUwlc8RYO4WBOHP05djoPpZrgYosy0HmAF8
	Hz7ymwYr18TMuUJrcl3ZFQrw4YRorNt4ZLjeh25pXyYSUDZ8a2CN
X-Google-Smtp-Source: AGHT+IG7F11Xn0lqOv4KGu/7iZ6iiyJgxaw95gini7m/8EETTNEt0NpX+bnA4fYd659ZxsoUWPTf8g==
X-Received: by 2002:a05:6820:220e:b0:5eb:7e7c:5303 with SMTP id 006d021491bc7-5ebee4e83d5mr2716203eaf.2.1729701637583;
        Wed, 23 Oct 2024 09:40:37 -0700 (PDT)
Received: from raspberrypi ([2600:1700:90:4c80::f])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5ebb7afc991sm1848679eaf.43.2024.10.23.09.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:40:36 -0700 (PDT)
Date: Wed, 23 Oct 2024 11:40:33 -0500
From: Grant Peltier <grantpeltier93@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: robh@kernel.org, linux@roeck-us.net, magnus.damm@gmail.com,
	grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] hwmon: (pmbus/isl68137) add support for voltage
 divider on Vout
Message-ID: <ZxknAYim1Dojp13h@raspberrypi>
References: <cover.1729646466.git.grantpeltier93@gmail.com>
 <422a40e992e047e250a3b1295503e3b81b5515ae.1729646466.git.grantpeltier93@gmail.com>
 <CAMuHMdWeqGvUZmTpo18oaOzYz1TEg97OuXyUSy9YJxmrWQWMBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWeqGvUZmTpo18oaOzYz1TEg97OuXyUSy9YJxmrWQWMBw@mail.gmail.com>

Hi Geert,

On Wed, Oct 23, 2024 at 09:34:36AM +0200, Geert Uytterhoeven wrote:
> > [...]
> > +       case PMBUS_READ_VOUT:
> > +               ret = pmbus_read_word_data(client, page, phase, reg);
> > +               if (ret > 0 && data->channel[page].vout_voltage_divider[0]
> > +                       && data->channel[page].vout_voltage_divider[1]) {
> > +                       u64 temp = DIV_ROUND_CLOSEST_ULL((u64)ret *
> > +                               (data->channel[page].vout_voltage_divider[0]
> > +                               + data->channel[page].vout_voltage_divider[1]),
> > +                               data->channel[page].vout_voltage_divider[1]);
> 
> You are casting "ret" to u64 to force a 64-bit multiplication, as the
> product may not fit in 32 bits. However, DIV_ROUND_CLOSEST_ULL()
> does a 32-bit division on 32-bit platforms.  So this should use
> DIV_U64_ROUND_CLOSEST() instead.
> The sum of vout_voltage_divider[0] + vout_voltage_divider[1] might
> not fit in 32 bits, so that should be changed to a 64-bit addition.
> Unfortunately there is no rounding version of mul_u64_u32_div() yet,
> so you have to open-code it.
> 
> > +                       ret = clamp_val(temp, 0, 0xffff);
> > +               }
> > +               break;
> >         default:
> >                 ret = -ENODATA;
> > [...]
> > +                       u64 temp = DIV_ROUND_CLOSEST_ULL((u64)word *
> > +                               data->channel[page].vout_voltage_divider[1],
> > +                               (data->channel[page].vout_voltage_divider[0] +
> > +                                data->channel[page].vout_voltage_divider[1]));
> 
> Similar comments, but here the sum is the divisor, so you have to use
> a full 64-by-64 division, using DIV64_U64_ROUND_CLOSEST().
> 
> > +                       ret = clamp_val(temp, 0, 0xffff);
> > +               } else {
> > +                       ret = -ENODATA;
> > +               }
> > +               break;
> > +       default:
> > +               ret = -ENODATA;
> > +               break;
> > +       }
> > +       return ret;
> > +}
> > [...]
> > +
> > +       of_property_read_u32_array(child, "renesas,vout-voltage-divider",
> > +                               data->channel[channel].vout_voltage_divider,
> > +                               ARRAY_SIZE(data->channel[channel].vout_voltage_divider));
> 
> Shouldn't the return value be checked for errors different from -EINVAL?
> 

Thank you for your review! I will make the requested changes and submit a
new version.

Best regards,
Grant
