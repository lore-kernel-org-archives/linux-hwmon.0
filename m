Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50E337DEB5;
	Wed, 10 Jun 2026 21:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781125508; cv=none; b=oY2ce3N92hv958RoLMho8iOMKVlWEowMvNlU1IGqxuonf/pgK8ZYzfz3B/U3SHnzQWo4WIp5EEefOAwgSxpwqLHsLbEL+tQ8PQjP36eLV687Zp4gcPOYSPhGK5Dcgw5X37Im/mSGLk2k3Q6NLznQhe+qP31VQmV3k+iA0BNH3A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781125508; c=relaxed/simple;
	bh=e1XyesHhSSdOepF9XMl7M84a2qn+asoqmkCv4+T0A88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4CgGBURIYZScMYfkI171qoW1vMg+qqJH+N6y84bvzSrfhhGbYDnZiekYZ4/SY74nTfcyXeRryFN6R/wGJP8OzRolc9Fqk55F1P52Wvn8mMZflBwJuRSjYqc+gvNLr2IswtD0nMCl2+kkWNLatVGGTx1SbePiUJhpBDfNK9rzmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RRulwjSJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RRulwjSJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435101F00893;
	Wed, 10 Jun 2026 21:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781125507;
	bh=ttBln2PDL/uIcc1HpCs5xCPbYiV9X8m2KmOBCOPnBp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RRulwjSJEkhkhmLvhk2iBUtFjWQGBozMUdwRAblhO3E7Te37OTAc66S/Ta6piTLAT
	 PjEoVEdGz9g9ggiVpfka9YOOn4o7MET3YvhTbOE/zDTbsopB2Z3iJetACVlWnG77s5
	 GRQlGy/tGbiRyQMoQpZvcSPdnKhStgnimw12kNlos4rXKm9jpjv1fAKxwTswV/kHJa
	 Kx3LV7RijpSK0mPbRdDSnNubMFB05UEddNkhLeZfDyDdWQ8ppX1hiqSXJx/rDlD23y
	 zBV77nbuAHOuymBWriyMzZryBiJ0M+gvybRGj5fcqdIhA8PBvpSsUT9bflty69IeAv
	 b/j8zsRzVu5LQ==
Received: by pali.im (Postfix)
	id CF9195E0; Wed, 10 Jun 2026 23:05:03 +0200 (CEST)
Date: Wed, 10 Jun 2026 23:05:03 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Dell.Client.Kernel@dell.com, mjg59@srcf.ucam.org, soyer@irl.hu,
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@roeck-us.net, linux-hwmon@vger.kernel.org,
	mario.limonciello@amd.com
Subject: Re: [PATCH v6 9/9] modpost: Handle malformed WMI GUID strings
Message-ID: <20260610210503.u2fcxq5qnrdtcdxf@pali>
References: <20260610203453.816254-1-W_Armin@gmx.de>
 <20260610203453.816254-10-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610203453.816254-10-W_Armin@gmx.de>
User-Agent: NeoMutt/20180716

On Wednesday 10 June 2026 22:34:53 Armin Wolf wrote:
> Some WMI GUIDs found inside binary MOF files contain both
> uppercase and lowercase characters. Blindly copying such
> GUIDs will prevent the associated WMI driver from loading
> automatically because the WMI GUID found inside WMI device ids
> always contains uppercase characters.
> 
> Avoid this issue by always converting WMI GUID strings to
> uppercase. Also verify that the WMI GUID string actually looks
> like a valid GUID.

Hello! Maybe different idea: Would not it be better to check in
do_wmi_entry() if all letters are really upper case?

Mixing lowercase and uppercase is a mess. And if somebody blindly copy
lowercase from MOF files to some kernel wmi driver, we can check for
this mistake in file2alias.c and throw an error.

> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  .../wmi/driver-development-guide.rst          |  2 +-
>  scripts/mod/file2alias.c                      | 28 ++++++++++++++++++-
>  2 files changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/wmi/driver-development-guide.rst b/Documentation/wmi/driver-development-guide.rst
> index 387f508d57ad..6290c448f5e7 100644
> --- a/Documentation/wmi/driver-development-guide.rst
> +++ b/Documentation/wmi/driver-development-guide.rst
> @@ -54,7 +54,7 @@ to matching WMI devices using a struct wmi_device_id table:
>  ::
>  
>    static const struct wmi_device_id foo_id_table[] = {
> -         /* Only use uppercase letters! */
> +         /* Using only uppercase letters is recommended */
>           { "936DA01F-9ABD-4D9D-80C7-02AF85C822A8", NULL },
>           { }
>    };
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 4e99393a35f1..20e542a888c4 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -1253,6 +1253,8 @@ static void do_tee_entry(struct module *mod, void *symval)
>  static void do_wmi_entry(struct module *mod, void *symval)
>  {
>  	DEF_FIELD_ADDR(symval, wmi_device_id, guid_string);
> +	char result[sizeof(*guid_string)];
> +	int i;
>  
>  	if (strlen(*guid_string) != UUID_STRING_LEN) {
>  		warn("Invalid WMI device id 'wmi:%s' in '%s'\n",
> @@ -1260,7 +1262,31 @@ static void do_wmi_entry(struct module *mod, void *symval)
>  		return;
>  	}
>  
> -	module_alias_printf(mod, false, WMI_MODULE_PREFIX "%s", *guid_string);
> +	for (i = 0; i < UUID_STRING_LEN; i++) {
> +		char value = (*guid_string)[i];
> +		bool valid = false;
> +
> +		if (i == 8 || i == 13 || i == 18 || i == 23) {
> +			if (value == '-')
> +				valid = true;
> +		} else {
> +			if (isxdigit(value))
> +				valid = true;
> +		}
> +
> +		if (!valid) {
> +			warn("Invalid character %c inside WMI GUID string '%s' in '%s'\n",
> +			     value, *guid_string, mod->name);
> +			return;
> +		}
> +
> +		/* Some GUIDs from BMOF definitions contain lowercase characters */
> +		result[i] = toupper(value);
> +	}
> +
> +	result[i] = '\0';
> +
> +	module_alias_printf(mod, false, WMI_MODULE_PREFIX "%s", result);
>  }
>  
>  /* Looks like: mhi:S */
> -- 
> 2.39.5
> 
