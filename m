Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC75313D638
	for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 02:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774925136; cv=none; b=n35GVbxSOLEVBbpWRbiPcMuQWYOCF1ve421rpBMjiyFMtdehPJn+WYCPBqyE1sU7Z5M3hPatV1XywjCNq7ZIvL+ISlbeouHsy9VEkZGsjQSHsrvEjiancsMC0zWy5/aL9xxysO/PeaOq8MnzvAWmo3T7voq036DXk3B7OxYSXQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774925136; c=relaxed/simple;
	bh=gmtb6ym3rJB2TqsSBmD6+u3N3aYS8mmxlZ0jn2rBerw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igMwCuxeonLMbkUSV+tgQX0YYk/elgidh9LwBcJNQLxtvrsMz9Ho4ovIM/o2hV0GPxJJ10m//i3n5PC4I3PgDkIT0HSZGURmIhKiKdagNdbCmc5WWbUfwaFF4hX9EdHXut27Fzx4pJDYnXWBiMRavyOxG9k1dOHr44RE6VXg17w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+jutgsu; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+jutgsu"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso3266785eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2026 19:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774925134; x=1775529934; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DuywKr5fh3r0GTQPzJ6SVafxalXSHpADk5mdAupw5a0=;
        b=R+jutgsugL86b0a+PgIItrmOWH2G39KQiTEaYhxm4wjldEBlo6lDgr04nhuQh72VEZ
         QWwd9VIVFCKyIyfXpWAE5U5AmNFXOoH9/nd6B5VrPr2zG3Z89abr7toF3dwY33GutL10
         sfyPQVsvg7h8KL7KikaFyUOF7a1hglKpXaz2DjrSdkLnnZ2ihS9Usc/FUbBVcODqlAoq
         tKYv70EMC/JeIBwtUpMi+vva4SQVTTUltTYpPNCVeIUtNcpiqLzv2n0K7Xp00s2TJiUQ
         xvdbpoh4718dYBizsbNkq5OcFS7/UnSk7MNuYByQPU5cQKG0fnuk9k6BzDUMStayHkTr
         faIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774925134; x=1775529934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DuywKr5fh3r0GTQPzJ6SVafxalXSHpADk5mdAupw5a0=;
        b=nwHVP16Lt/6EUqX/j4Stg0aneOywXRfXTp7p+/TADCCJocNUsR2fP5cimpMfbtuxb8
         ccBM74wH/OOGQnH7zUn7lSZTsaZIinwNsBTuNKfBt9Hg0EIF3JHMZi1ispX8ChzJSwUo
         N2gT5XSmZYlGa5rTdCZxquMl7ro/RD6tp5XcucLCfXBS2873r7tOML0wQBSx+e8fMk0i
         V4pxPn0gWBFqdEOrmB0wzrd3ZlTsM2e3VBYyGe8yRsLXUoCnAmBC4S7WjoWgbryQCxOB
         mQfg28N9aXPuFDD4Y6K+ONG1UzpW5b059/1Ladauuj0TEOnPGupIKl8HSZ9PXlUpfshF
         5vVg==
X-Forwarded-Encrypted: i=1; AJvYcCUk4yvUC8W3U+uUetam2xhpES+ROZbbIfqGK5l4zH6brDWSbmGi73DFEd7nq61G0XamWSflGaDyel3QcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjA2xR5TC4D/CNetJkCzUDUba4uhZm9PrdGZ7iyJGmlg+t86n5
	ZmKsCfWcwrh/ZbazVzmSseDbd0nSTzXJ7OvUBf0aLz5DtZ/NYFjsV8kC
X-Gm-Gg: ATEYQzwFU4cFbABkzJ6U4hCIawpph1z6cm+RTHqTE/qVZws806vZVy4g/Eu29T5m5/F
	eZK3OuAXE1Omc22fZeDnbKUcdIc4eWyKyTKywKcM0H3gMgsqrDbGGgCjXU7Rw5yehUefhpl7QHg
	kKdL9EC2nRPcsYUXmpFq16ly0J2ZN90q5MXfgbZL0TnHtQwC1IaLwidOTigwRY4TixasQHrQ+9Y
	ors2KFjeEcg5UHE5r+YTE6VCym2/nmixsHZZI32WBwAM0Ft7eXPWizF2F94cmPhgoeBI1U1kn80
	OT6aAOsjOIeZ+wk5bs861lguAlmTG9wQGKujk85xwcsPxe7wG61NaR/Nx40FXqebzlobu0M7TqY
	RBzqlaIrj06yNG4n5WR7glwoANeSpEbb+6AIpVU50J7uhaCKnXqp5eaNoqzwNcESOH4GXVtaCme
	xv7FyJvJRxFUiylpTJIi2DoITcI+HG9oVJ444y
X-Received: by 2002:a05:7301:2b05:b0:2c5:6140:54d6 with SMTP id 5a478bee46e88-2c7baf441dcmr1032879eec.1.1774925133805;
        Mon, 30 Mar 2026 19:45:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c68b249fsm8763549eec.19.2026.03.30.19.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 19:45:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 30 Mar 2026 19:45:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Sergio Melas <sergiomelas@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH -next] hwmon: (yogafan) fix markup warning
Message-ID: <abe8e17d-48e3-4d1f-b9dc-1158b4df2d37@roeck-us.net>
References: <20260330214624.3781789-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330214624.3781789-1-rdunlap@infradead.org>

On Mon, Mar 30, 2026 at 02:46:24PM -0700, Randy Dunlap wrote:
> Add a blank line between the License and heading lines to prevent a
> documentation build warning:
> 
> Documentation/hwmon/yogafan.rst:2: WARNING: Explicit markup ends without
>   a blank line; unexpected unindent. [docutils]
> 
> Fixes: b773f2e6b472 ("hwmon: (yogafan) Add support for Lenovo Yoga/Legion fan monitoring")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Applied.

Thanks,
Guenter
