Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSiMJERz"
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F80B8;
	Mon, 11 Dec 2023 06:34:33 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5c1a75a4b6cso2242927a12.2;
        Mon, 11 Dec 2023 06:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702305272; x=1702910072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BhFeURBLxLzEVc1vRPu/BJJbPB/L1vjdzzDdvH8sMws=;
        b=LSiMJERzD69cg9RqqDSsZwS57yhv4f3UsqaDIU931qtMo4bCvlXHKJe2QuF8Uon+S7
         iMasAz4UgR/+Hh4s1bR83woxVwpqW8xxDtqjZV40f8C6AmyE/CqnEJlx/CG/H6A1TW4+
         vGBu4qHlEBarw7TEjpQtkFB+g77pf7xu7ViuOssQaloRhHXCwNT2wXbnOLRIZmbCgzt7
         kcA+O5VTtAHekXZeBgcNSijLgX7UpHYb22CzFohWuCmMzJL2tzADeXMirsGuNw95rida
         aIoDHD2B0BAiLhTi/F89apXzL85kcOeKiUWToV3WjN5TS755/7HUCTYuaZu19ajj5GLv
         3vMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702305272; x=1702910072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BhFeURBLxLzEVc1vRPu/BJJbPB/L1vjdzzDdvH8sMws=;
        b=n5e+WcaivL4AWIC3r6+Vc5n8AvaCAQLmNdNaOjT2S8gmVxcLDvNj1XZg3PKYeu/Nm4
         N/TkzjRIzadRFKPymlqsYuY3WUCFW70J8K3U8TvgnJs6QV0Tpf4xsR8Ci+QhKLz0Qadm
         c5RlXLnWP9yQUeSai6XV8g0KaKG9s5YNku1mW/PvXUEvV4Qk9R1wLr6n2nXTmsK9ZyU2
         YITFHFrruoQaze6LIGyNe4x+Owvo9Ywolla4BqKGBbsGXW/6qYqJFeNCSF/IYrHiDwYo
         pLBx0FTV6w3rfijWFnaJ8cJykmProfNtGLAzvUi3EyfYf4Td8A6+biVdV7W423uhtO2h
         q2ug==
X-Gm-Message-State: AOJu0YyfEie4tAOly9IK5LdDObH+m4WwNystpv3IUoRkImVlXivDewwn
	Swn0k/lEEiHRC9a3+W8N6jF9AXOMS5A=
X-Google-Smtp-Source: AGHT+IHOFIL1vKAZj4Zu3p22Zn/R1Kq5OPfAzqANWOQ4JZWJBcYr9a0VQ9kgOkHoYdj5IOjrq+uvVA==
X-Received: by 2002:a05:6a20:8e14:b0:18c:b6:ab4f with SMTP id y20-20020a056a208e1400b0018c00b6ab4fmr1878951pzj.48.1702305272500;
        Mon, 11 Dec 2023 06:34:32 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b16-20020a056a0002d000b006ce70d26d9csm6389748pft.27.2023.12.11.06.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 06:34:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 11 Dec 2023 06:34:31 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: David Heidelberg <david@ixit.cz>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: hwmon: gpio-fan: Convert txt
 bindings to yaml
Message-ID: <08ecf10d-03c4-4025-8809-475fb5ee76a9@roeck-us.net>
References: <20231209171653.85468-1-david@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231209171653.85468-1-david@ixit.cz>

On Sat, Dec 09, 2023 at 06:15:39PM +0100, David Heidelberg wrote:
> Convert fan devices connected to GPIOs to the YAML syntax.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

I keep wondering: What does this have to do with arm (in the subject) ?

Guenter
