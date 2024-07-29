Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com [99.78.197.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A329818A95B
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jul 2024 21:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=99.78.197.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722287789; cv=none; b=pzfn8l4qdfR6uyUOwQymY22KrvUSFuok/SbxALuFCRvjNcjQulgCJDYlOBczoB2f3ro5q9LHJxLzFG3pzPkjD7nN8vR0uUNt1bd0a8y0QOdguguZ0pbwHs/uN5V+e/0kEF0pSjYltN22rvXJDLIv7FTFwAngL62vdMs/ulpGQqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722287789; c=relaxed/simple;
	bh=DfS5Lft+7rgYXkz4Ir4gLEYVLwWXMFqeEzc1pS9Fr1U=;
	h=Subject:Date:From:To:CC:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IwWnDfqkufHts6EfsJ44fexhus25VtPh64C07OfojbCw272EDe0P48g1DcCkVd/pwJZ25vK8juMWhQ0qcaaIeSIyeHHWlj36XiYx8hcl5/zr0S9RrNQQ3+xc5D4ZFOuLwAKibt3xS+cjnj08l2FphOtTF+vha2CqBoS1Y382OrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=tp5pel3b; arc=none smtp.client-ip=99.78.197.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="tp5pel3b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1722287787; x=1753823787;
  h=date:from:to:cc:message-id:references:mime-version:
   in-reply-to:subject;
  bh=SfAI9ShtahCg7o752Or9yhShyq2yCakvi32iWPxqIXw=;
  b=tp5pel3bPXVdGrGLkxqRqKEcg1LU9EDV/UQWdzx7FBHAIRXRXZXL9+i+
   cO0yGyf08OfSujjzwbLqgwnAknz5NLH+x5dYBx6xH85Psuu3YAF+WfjnK
   vNAiW0VgXVPW7BpXtQNrmethdI8jo8uBsWpZ/DsB6g4CEMVAomNIvwziO
   c=;
X-IronPort-AV: E=Sophos;i="6.09,246,1716249600"; 
   d="scan'208";a="316343414"
Subject: Re: [bug report] hwmon: (pmbus) Register with thermal for PSC_TEMPERATURE
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 21:16:27 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.38.20:64399]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.63.84:2525] with esmtp (Farcaster)
 id 515944d5-6331-4e4f-8214-398519466c27; Mon, 29 Jul 2024 21:16:27 +0000 (UTC)
X-Farcaster-Flow-ID: 515944d5-6331-4e4f-8214-398519466c27
Received: from EX19D005UWA002.ant.amazon.com (10.13.138.215) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 29 Jul 2024 21:16:26 +0000
Received: from EX19MTAUEC001.ant.amazon.com (10.252.135.222) by
 EX19D005UWA002.ant.amazon.com (10.13.138.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 29 Jul 2024 21:16:26 +0000
Received: from localhost (10.106.100.44) by mail-relay.amazon.com
 (10.252.135.200) with Microsoft SMTP Server id 15.2.1258.34 via Frontend
 Transport; Mon, 29 Jul 2024 21:16:25 +0000
Date: Mon, 29 Jul 2024 14:16:25 -0700
From: Eduardo Valentin <eduval@amazon.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Guenter Roeck <linux@roeck-us.net>, Eduardo Valentin <eduval@amazon.com>,
	<linux-hwmon@vger.kernel.org>
Message-ID: <ZqgGqU3JlRM3RZPS@uf8f119305bce5e.ant.amazon.com>
References: <abd89e07-3a61-408e-ac2c-67ec0605f12b@stanley.mountain>
 <cddb4e8e-4b4d-48de-a02d-4931c373b47b@roeck-us.net>
 <d88d5476-eec4-4e0c-8375-18dcc168e31e@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d88d5476-eec4-4e0c-8375-18dcc168e31e@suswa.mountain>

Hello,

On Fri, Jul 19, 2024 at 05:33:19PM -0500, Dan Carpenter wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> 
> 
> 
> On Fri, Jul 19, 2024 at 02:10:16PM -0700, Guenter Roeck wrote:
> > >      1373
> > >      1374         /* temperature sensors with _input values are registered with thermal */
> > > --> 1375         if (class == PSC_TEMPERATURE && strcmp(type, "input") == 0)
> > >                                                          ^^^^
> > > Unchecked dereference
> > >
> >
> > It is only NULL for PSC_PWM, never for PSC_TEMPERATURE. We could add a check to
> > make the static checker happy but it won't make a practical difference.
> 
> No, don't do that.  Just ignore the warning in that case.
> 
> I'm running with the cross function database, and in theory that should
> have silenced the warning.  I'll investigate.

Nice you are doing this, Dan.

Yeah. Let me know the outcome of your investigation. I can always patch it up.

Thanks.

> 
> 
> regards,
> dan carpenter
> 

-- 
All the best,
Eduardo Valentin
