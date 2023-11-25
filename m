Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eN+2temP"
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7309127;
	Sat, 25 Nov 2023 15:59:03 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6be0277c05bso2660416b3a.0;
        Sat, 25 Nov 2023 15:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700956743; x=1701561543; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7yH14cTXqBCnY0/TJsIL1PIRgw/RoBY5Z4zX/qkJYg=;
        b=eN+2temPAXtwZt5CQ66MKlX1iV0bXatTiyF5fmutRckfy4yZve8qjX9jywV536DlVA
         el5syoheB4Ze2Y/eYuKPRiD3GnygnF/kxgkIcDa8rSGRuW61+nub64PYBPkxteXDxUKO
         A2lCuMzNmfZv+TaBaLWvbRSYPYt6nuLcdSi6WzdOvxVSspSsl5BlK8jgXHFKbr3vIERx
         fCdUQC55qvX/uUAWkjjdPicFNfhqB8oiktLEQ8JGPeeIowvTvRpTtsdv9r01EBZj06Yv
         u7ZzOCGPqJj7/QNfRY3VzSu/6vgoAu+Rq2DZP1B8+f08za88pHxMXMhK8QBbk9L1pJOs
         16qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700956743; x=1701561543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z7yH14cTXqBCnY0/TJsIL1PIRgw/RoBY5Z4zX/qkJYg=;
        b=R/eLhS9QZhQWqr82RvhcMFFgsZF87eDnDr8qRxf8VmscyS2NyhP27EkCLiREVKU+3S
         gm8Lcgqnv4XaZAUn237sw9IS7bcCRMSRkZSUIYJjcVYiUfOvUu0trGJT4yStLyKJgxUW
         GAxdX63K52TFoBunwSoOckT21+Mo6CDWneJisHTuR2Rbb9OrjT4JOxM2j8i4hOKYm80B
         TYnPt4VxcWZPgctEWtjs/4S+9jdzqDinI1O+dq/5n/sVyqbLcEAxaIoJxKQDwZRn8rzl
         R8pZE5OqqgsjU2pM7L4hE1CZbSg29XmvIL0zejutMrr9JrBsRzMJiJANl9MV/GHvJ22R
         s01g==
X-Gm-Message-State: AOJu0YxQUQHczt+SCoos974ZPvtQnfdXo3gGRkrMF9i+lsMvZ27rsFvF
	qaf115wJJ+kLCbQ0WhVl86Y=
X-Google-Smtp-Source: AGHT+IF5siBYpnzCbLgFjdJ2fi3qSRSySuKCnjgD16vK+Wb0j3acP76sSk5/RkTEGRngZpV+qTJxAA==
X-Received: by 2002:a05:6a20:2d14:b0:18b:4a28:6e2d with SMTP id g20-20020a056a202d1400b0018b4a286e2dmr8559366pzl.22.1700956743232;
        Sat, 25 Nov 2023 15:59:03 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 4-20020a170902c14400b001cfc00d26c7sm650048plj.11.2023.11.25.15.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 15:59:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 25 Nov 2023 15:59:01 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Stefan Gloor <code@stefan-gloor.ch>
Cc: jdelvare@suse.com, corbet@lwn.net, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: sht3x: read out sensor serial number
Message-ID: <93260e2e-a913-4341-9bc5-ef23ee3b396e@roeck-us.net>
References: <20231124145519.11599-2-code@stefan-gloor.ch>
 <52909c46-4699-442b-9303-ec914fba093b@roeck-us.net>
 <20231124220541.gvyaf7cbtc3kbesr@thinkpad>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124220541.gvyaf7cbtc3kbesr@thinkpad>

On Fri, Nov 24, 2023 at 11:09:31PM +0100, Stefan Gloor wrote:
> Hi Guenter,
> 
> thank you for your comments.
> 
> On Fri, Nov 24, 2023 at 09:34:48AM -0800, Guenter Roeck wrote:
> > I am not going to accept this as sysfs attribute. Please implement
> > using debugfs.
> > 
> I will do this in V2.
> 
> > 
> > Also, the attribute (sysfs or debugfs) should not exist if not supported.
> > Please only provide if supported.
> The driver is currently only compatible with "sht3x" and "sts3x". 
> As only a subset of these support this feature, do you recommend I
> create new additional device IDs, i.e., sts32, sts33 and sht33?
> 

If they have different functionality, they need different IDs.

Guenter

> Best,
> Stefan
> -- 
> 
