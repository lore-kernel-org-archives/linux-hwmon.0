Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C467914BFA2
	for <linux-hwmon@vger.kernel.org>; Wed, 27 Aug 2025 15:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756310337; cv=none; b=T9SNMlClt/gmEKkrNfDbV9pvt7EhNUgbjHVJVU75+4bZhVxXs4pbqALmMudlkyKW7P0nRzah7EFVkgTd1csh5wnJyMCWyXTyXrwos4FBhekWc07XbymMV1PbcUOs13HeA5Shztn07crb6zZaa2ENzCCJ4DDOawcmZdUJDhUbG0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756310337; c=relaxed/simple;
	bh=LhRlS8+lhi0KXFINgtNqO1Ad6DHHtlA1SrPJoM2aJHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/jr3DLk1k0gLsL0vguleKe+19ykmcl0frQXstwAQ+pxGNwWOzVNXX+MNXTYGwJwI3dzp2JS6U3AKEkB6kgr5wWTHRRlIca63K8eA4qTeQTEt+vnm9N9a4+B/pwPsRMSnirW8MLLeXEznUHiwpbz9a75Xs/C2LOp5tet0QYlXlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4y9yNTk; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4y9yNTk"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-76e6cbb991aso25968b3a.1
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Aug 2025 08:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756310335; x=1756915135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=caF1aw9rpOK0IBISAyRJtFsgSz01pTAHxrl+5Lawo1k=;
        b=P4y9yNTkfub0S7B5Aa/tQgxNOutSl/XDcdYmPt92lbIm/vOSqxpz4VL2hNdH4Y9LRP
         M5nMxQtxIzMIBmSLuKdznd0f4OZ3yEkEd6FMv+hGIB+EK9gfs2UrtOwJoZeTt9DzJSQW
         1Wsua3R0KHAOd41Lz/qYHxXyXwOo/NG6EBZMfos3WZD/cI9CvZfXaZxMDWjtkYRcVMEd
         r7+ozHdt1++jZyIekHz7Y9B4Wi6eYYsRUqE3iGfWN0QahmAafnj6Jg4nSlBUOZcNx7Gn
         6RpTU19ZUtbyEEfR18uHfZfixG+vL4PPTf4XSNZX40Z6AO0kqh2/WDWFK+bLbqB8jOny
         5JlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756310335; x=1756915135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=caF1aw9rpOK0IBISAyRJtFsgSz01pTAHxrl+5Lawo1k=;
        b=JaY1l66cDbrGLAnzeVI7OrWs/LvGUsoj8Ch5j/K2eR/EJcgMJZdKCCWrfZJfU92VrT
         KxvaXkUcgM1e81fJmTOJwe9rAiW3DavoAhrF18NgFtbGiC99/bjqrpbvkYGS/X7EbDIq
         zAPT2WJRYfFrPonZ5FSKYDZg1REtKx9G8pNT5qW7TgRc8VrO/8kTnI9lYo/SjzKCEBGk
         CKdqk7qHDvxKGr+7Bp5ML3nZhVDjO6ssBlIg2dnztMK22q5BSau16iLJH5i1ZY6SvZIJ
         PvkdF/OnB7Y70+Rc7zKpeIAznJvaog22mdT+UgpRey8QVrVl4e8ipySjDWmynoCAxt+T
         ROEw==
X-Gm-Message-State: AOJu0YwI7+QrR8u2AJHUi2tCmV7LZz32vAjZhd3TJCH7xSQAnIrMlYiw
	TekbDQ2axyQYJWeXQUBNPv/6pc9XH1U5a59z52UqMBXxgKEaKR8d6d6u
X-Gm-Gg: ASbGncu9t0S1nlypTzXR8S8OAU0VBRvjawPJ2JmfQCdULpoceDesvqA8SAcNR+2GRoO
	OHhRvOW5BZR17xV7y/c81cORR3G47jE8+z+S910jB4rlLvCb6X1HDJ1je1Tai/YbeQHtLKc6JJ1
	GFMAS+GJOHUqZr9ey4l7cwPzuQ01pBIezIkIggQiWeZRuZKqsK9M2mQ1z9nOnlofYYpHbrvp8zM
	VGD8wOaY2hPAm3eWXEzVz01nkciHtUcOGv5KDcRjByHijaMugYik4A67yLTRH9DTVc8dAFmE5qk
	ZgU5w3QUI6q+o8/pY24lgK+5bS1J1XH17WGMnMzp6O8BCwL7ONsFhB9QzghUGkS/jp23IJVLv+Z
	9xLo3VzDu0ZDrbn9bJYtEqs/sHUMMaScd2PE=
X-Google-Smtp-Source: AGHT+IFpbKQAh/xaiGle9jZIlpjL8R4iC6B1N2AGchxYPB6aIERnLeE+bWmpiNwFtYOciUWpzJHBUQ==
X-Received: by 2002:a17:903:943:b0:234:c8ec:51b5 with SMTP id d9443c01a7336-2462efab368mr249843955ad.53.1756310334907;
        Wed, 27 Aug 2025 08:58:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246688645c7sm125345285ad.78.2025.08.27.08.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 08:58:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 27 Aug 2025 08:58:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] hwmon: (sch56xx-common) don't print superfluous errors
Message-ID: <b1664aa8-e3ef-4f91-82ca-b038a75cd619@roeck-us.net>
References: <20250813190728.3682-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813190728.3682-2-wsa+renesas@sang-engineering.com>

On Wed, Aug 13, 2025 at 09:07:28PM +0200, Wolfram Sang wrote:
> The watchdog core will handle error messages already.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied.

Guenter
