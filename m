Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D7A23AD
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Apr 2024 12:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712838713; cv=none; b=TyiTHYk+gfB4JHczv1HHC3729X1IXt+EmmkfFoTyterQz2g3dhHW/ZP3aeSU2C9eOueDjsgpGntgM27oOgBCzT22v8NGnyOlm6TYTMba/heK3yoBwYkhRAKCAUcPr+UWMQASWH7jgBGb/olCssk/L9/YUzqVKbftDkjaS8oyp8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712838713; c=relaxed/simple;
	bh=U6IrDt/TAVa4luXWmnrA+2xkgBdSCDwr9nboKz+BRsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXGhxOj4J+BHcZEB0qo4mn0k31p+oTXZPJVqGw6aBEBUbBbu/a6eTiQXxgpcTujrnsu7UG6IfjUFjZ91sz2MeqRB5uvrnOa8F0/EwXrD/uk5UMYN0iRJeOoDYOORSNCu0L1Zg/klMZJxYWU0cG195DN+k2br9yLv+S3GJ5rDBUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VlGmId+6; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VlGmId+6"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6ed054f282aso4943102b3a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Apr 2024 05:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712838711; x=1713443511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1vI0OaxKns5dyu3Jsc3EZk5Gfvp8gg8Yt940kOi583Y=;
        b=VlGmId+6hYQDiralN3dT7tGFNPu3Dn31CQ6Yt0h43DuxuMUXAf2UOQDnN4ZZlRX2PV
         g5jf3uu6MixR2o1Ki7q6PcViLYBpi04ajQekJJ1DQMrvE/hxz4ZlIrEPdABYIHA6GG06
         Slrjfm+ReDpmpEq3TsxFEr/xT489yZzFmpkn15/4Fl41cdB1UBDjmXw8rcCUcpQuvzV+
         t7HCTzTOws/tbGTrD1vy/2FYre3bbv2S/iZoh5LOHS32Fn0ceWTAWsWCMUQyOVR1UCFk
         rnGq6iVUn++Z1RMCmDKm1L6zhaW2ZaowkW7P1vHeD+kF7RfSc7orv3OBcwhB1nNUaAWL
         yj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712838711; x=1713443511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vI0OaxKns5dyu3Jsc3EZk5Gfvp8gg8Yt940kOi583Y=;
        b=NwU6YJuQlPbSCU7R74PbiOBnC/ZALvG1xCchmNP3jRHBa3czSrx7lf0AdIM2ssX9v5
         rJyyKOmhvszlfeaWas26gzdbTOlAuOPNosApmJEaori0aYGkQWEizkfTiMt4SMfOvcr3
         G1XYIGPBv8FQgBrwoGunNbKDxG2ZdeeQKC9fmvJX0HfNMbRjLW50F25d0T7nHjLDsB6K
         N1Al/W8gQNqt3pnBmso7WOkmIOZJEthKyR2U/8ld17296ecelGGdSQ79f3bYymcvkLVO
         dyEqTIdG9e64x1dM9Cql/QqtyLL6492GlwUsm+KocrwPnEmBSCujGrHu96xSCfLh0QTA
         5MKA==
X-Forwarded-Encrypted: i=1; AJvYcCW9Vpyp7aZiVs8QQknusRxdCxrN/5DNno11DXtTcun4GLm8DCl/T+OdcWsjP2m9tuHeIOlMSNrbg8IPLKLpLMQeZugCCBIBjJU4Xdk=
X-Gm-Message-State: AOJu0YyeDrURJgmi0uwKBigLQOMxJdsc6d8OcP8pJKr4HQv+zR9/JGKN
	Xrj79nipneEKgJjN1XBvqmRYeONtBydXFnTJqsC5lUmG7FGsMk659Ta2og==
X-Google-Smtp-Source: AGHT+IHC86DZMaRrPPbqSTDsjaXW0eGIIytw8K/qOCPgO9+UVJJbAqoeboiNqhWCgOQMQic9XLUxKQ==
X-Received: by 2002:a05:6a20:5530:b0:1a7:556d:db5f with SMTP id ko48-20020a056a20553000b001a7556ddb5fmr4919730pzb.47.1712838711272;
        Thu, 11 Apr 2024 05:31:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t42-20020a056a0013aa00b006e6cc93381esm1074187pfg.125.2024.04.11.05.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 05:31:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 11 Apr 2024 05:31:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Frank Crawford <frank@crawford.emu.id.au>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v1 1/4] hwmon (it87): Rename NOEXIT to BIOSOPEN as more
 descriptive of requirement
Message-ID: <4b3c04f8-49eb-436b-b5ed-0ade6f1d48a1@roeck-us.net>
References: <20240401025620.205068-1-frank@crawford.emu.id.au>
 <20240401025620.205068-2-frank@crawford.emu.id.au>
 <f4efa185-7312-4116-a843-a6d7e0c22c79@roeck-us.net>
 <c3c69b27c61702b50f99f866c30f91f44ca23945.camel@crawford.emu.id.au>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3c69b27c61702b50f99f866c30f91f44ca23945.camel@crawford.emu.id.au>

On Thu, Apr 11, 2024 at 09:03:06PM +1000, Frank Crawford wrote:
> On Wed, 2024-04-10 at 08:10 -0700, Guenter Roeck wrote:
> > On Mon, Apr 01, 2024 at 01:56:03PM +1100, Frank Crawford wrote:
> > > Rename previous definitions to match the new information that they
> > > are
> > > preinitialised by the BIOS and should not receive codes to enter or
> > > exit
> > > configuration mode.
> > > 
> > 
> > That is wrong. NOEXIT is needed for broken chips where two chips are
> > on the
> > sio bus, and disabling sio access on the broken chip results in sio
> > access
> > errors. The description is also wrong, because SIO mode still needs
> > to be
> > _entered_.
> 
> As noted in the patch group write up, this change has come from the
> technical specifications for the chips not for the board.  If by SIO
> mode you mean the sequence "0x87,0x01,0x55,0xAA" then it should not be
> used for these chips according to people with access to the
> specification documents.
> 
> Unfortunately, I don't have direct access to these documents, so cannot
> quote the full description.
> 
> Now, the macro name may not be the best (BIOSOPEN), and I'm happy to
> change it to something better, but the current name of "NOEXIT" is also
> wrong.
> 
> However, for the chips that this relates to, and are defined to use in
> the it87_devices structure, you can access the chip details without the
> the superio_enter sequence, as that is specifically the read that
> occurs to find the chipID, and I have tested it on a number of
> different chips, both of this type and older ones that do need the
> entry sequence.
> 
> What makes this a little more difficult is that the chips that it
> affects also only ever appears to be the second chip on the bus, which
> may be by design, or just current usage.
> 
> I will add that the use of enter sequence has been confirmed to fail
> and cause the exact chip lockup concerned about on the Gigabyte X670E
> Aorus Master board.  While you may say that we should only do this for
> that board, the information I have received is that it is cause by
> incorrect access to those chipIDs, not board specific.

It looks like you fund a better source of support than me. All I ever
got was "we do not support Linux".

Anyway, please find a better term than BIOSOPEN. I don't really care
too much what it is as long as it doesn't suggest to be related to
something that it isn't. FEAT_NOCONF or something similar might do.

> > 
> > Also, a BIOS open mode, if it indeed exists, would have to be be
> > board
> > specific, not chip specific.
> 
> Now here my description may be wrong in it being BIOS related, but
> rather it is specifically the chip initialisation, but the details on
> access came from the chip specifications.

Well, again, BIOS suggests that the BIOS is involved, which would make
it board specific.

Thanks,
Guenter
