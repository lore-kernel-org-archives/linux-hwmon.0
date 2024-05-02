Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9314F890
	for <linux-hwmon@vger.kernel.org>; Thu,  2 May 2024 16:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714667818; cv=none; b=u8BRlGrIHSBUgsLhlDeWRBvThfsJ5c2AlcSfrusiync+TimilVtfGScHwPuKZaF2UJZSDd5RbsNDme3vu0vmfNzkHPu390muT/tyuFAL0B2PsEr4ioUO3f4C8yy9QnN8MG/8jN2IVc7eWxmze56bvEceXwsw3wfgH9OPPZhNvQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714667818; c=relaxed/simple;
	bh=hxh6vLlaBAmJMIpW+o9O8Kuvdm38PoN+9whXOP/foBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GJzYIP3Qnpe33dmyU0MBvvu0QCyo0+l8GwrKM835FnaWQLS8tG3ANyk/4ttKO6F3psPCht5pC3FfTnogfChmWmMEBOL/cbI01LDJigBafHrbKquHEVg59TD8lQ2TwToipWiw5K89kCGQ6Kf2RyHx5V6zU/BJWIVrA/0LJbQzPcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=BY4/vMhZ; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="BY4/vMhZ"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2b2768f5bb4so2616913a91.0
        for <linux-hwmon@vger.kernel.org>; Thu, 02 May 2024 09:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1714667815; x=1715272615; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hxh6vLlaBAmJMIpW+o9O8Kuvdm38PoN+9whXOP/foBw=;
        b=BY4/vMhZGJIiRmmXSG23/iXW24hrOk99UxO5c7e/tVtqjWHyYNf5XqvtveBlVAxcF9
         iu+VcIdAPE1vDMrYzm2WTZYQ4/RoJFQRnkKPt8Mnhqwg8uvDnljukQW/oFFX0MFrPCcu
         DRR4n2NRZsPxUdLzrw+yfmjmrKhttOuZGYFh2Qwdx6hPlDRyZ6yqK70kFJDjHSCZyNgc
         nUQSQZ/hEt9cFLelDBMPAUqgSsuSjGkgVXgH1lfvP98Uw+huW65wePFxLmvf8Shn/lw8
         633antLanhuWZklyHIq01A8OT61+ybIbGVwZ4kJlv1hJhpg4Xp49pdxLn1jFlgPb/yQ2
         +DnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714667815; x=1715272615;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hxh6vLlaBAmJMIpW+o9O8Kuvdm38PoN+9whXOP/foBw=;
        b=qVjmTej5+8nHndx324PpjeBr+Rb1iNc7BcqtQ9yYIbT8o/YjLZhu1bAIU81fO8CAVk
         Ax6AuRFDx4ddpxNsG/8SFMk/+tj+JVN5uxLFSXy9/st+HaY7GTPC2WBi8w4c8ViIEyqm
         VwlkHW8sZ63b9Ncp5FKlaIaLEhiSpcC73dxNmP80k+ZasKzFKa/+c+aNi/D8soznQtC7
         UGKeAGzp2K8E1m12bx5ujf+Q5ialZVgPo+6oPgcXrAmDq5lAWs6fWXzlfY9s9aWOxZa9
         eBhRJxiPI15v0tJO/C86t2nbX/V+Jw7wLICPMldFDwKEMY7mBbQ4daPdHKoiACaFtrgu
         tJfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpRwYgWqLsAIYEYxeUGmsZNJqcSBvH2br2BGIWnnTUdMnBf3Udy+PE2Jo1Yfy+UyECA4pzCFb0e2Vekv1cHAxup/pv/QgIb+lmaJU=
X-Gm-Message-State: AOJu0YxNCuVJjoQ+/uujT7LjxLi2i2b0nMnVKPERATjVJDRjQHDx7v+R
	sAQFuUOZkCtOy4kjmp6OjhrGmCwpw8c2v66Yyasz+8rHF9P9FpnrV3GShWz5ABbHnHZCADl43un
	RwzA6NCCxhjOELJLXm3vPGRvlyjoY/J6dvIlyWQ==
X-Google-Smtp-Source: AGHT+IEuOqyeziu79sBDiYNWNKAoD8V7qZLGHIvBnQ/cgZc+zCD0DGKXAqqp2TIOchm67nCvd+puIynmJN1u5g+FTiE=
X-Received: by 2002:a17:90a:ab92:b0:2b3:ed2:1a77 with SMTP id
 n18-20020a17090aab9200b002b30ed21a77mr332035pjq.10.1714667815631; Thu, 02 May
 2024 09:36:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240430210539.935040-1-naresh.solanki@9elements.com> <1fef896c-0624-4a3c-af3b-ecb43782eea7@roeck-us.net>
In-Reply-To: <1fef896c-0624-4a3c-af3b-ecb43782eea7@roeck-us.net>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Thu, 2 May 2024 22:06:44 +0530
Message-ID: <CABqG17jpAGzH-=SQ1rwT6x5kt2m3HKviup_Jj2P7XU4HdeogyA@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon (max6639): Use regmap
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter

On Wed, 1 May 2024 at 05:24, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 4/30/24 14:05, Naresh Solanki wrote:
> > Add regmap support & remove local caching.
> >
> > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
>
> I assume the first post was superseded due to the missing version ?
Yes. Apology I pushed the first post without updating version.
>
> Either case, please provide change logs with your patches.
Yes, I missed this as well. Will do that in v3. v3 will include
fixes you have suggested in v2.

Regards,
Naresh
>
> Thanks,
> Guenter
>
