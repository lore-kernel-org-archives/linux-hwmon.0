Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0CB2772D;
	Wed, 10 Jun 2026 21:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781127111; cv=none; b=PT+GTaU+Q9/0aHvdAAzWaMKBdMThLOXlKE9PG0tTaNcrtcdHIAng1ku4MByLlDFLSPieRjaXagqYZB1Ehrw6lSNM4G5zIfcWsCO3/A94lYIZgB+vyaLz/4zvmAwe40XikGqC2uH6mjivMC6C9VQMqP3OVaylGZN3em2JpJ3/ajs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781127111; c=relaxed/simple;
	bh=5Gr3oL+L5EdgXAtYnP3eO9FOKEBtiE7d4o7PxnL6E7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hiKoLWHDspZtcUnNdEbTtMTo3Gw8sPQu3x58/fuIy2Ak990eHgVunud0M/GGWV/XtC/YATrSdlI7HL72HHafimxQy7ykA/pNY3ltk9dBB2nbp2kFcdLtwD2qCFCb5OUMP7fzdDDj/eppzTioPG7z+mFMDsUuzZ2j4tGOSZc2sZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=KDyjmEOg; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="KDyjmEOg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781127082; x=1781731882; i=w_armin@gmx.de;
	bh=daqK5hAnTTT3rQAB+Gz4KRTiO8Sgr2aVp4Wl8Cdd8Uc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=KDyjmEOgOTZMunBZW1m9FWnVY3xJE0s9MQ75V1T93p/DAvp/wjvfelBL2urP8/76
	 1epuz2NiBTeWRTyz+PA2elh2mEIHS0AuZVlDjagi7ECfBIDsIKvR2uI8vpcKQcOJd
	 +cmGXqzJZojrqeB2b26Hc3dva4nSGZPP2hYG3XJSaRNjS+WYQjIMmgkrcTCCkS8YH
	 +z/EjV/y3/wM/ezlOb74fzWeSIHGb+Tgjz1kA7U+hf+SSQLZqT3/ZxlVbw7unjwoK
	 6krRibHV9CizD5Snpn597iSCrim04Vhzx3oN9aHQ9WuTv0Jx0npEdbjCdSfkXEkhR
	 IPMI8/njvAnOZXFyDA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N33Ib-1xDscG1lTp-00uwWe; Wed, 10
 Jun 2026 23:31:21 +0200
Message-ID: <97bb6a1e-4f9d-4946-a171-86dccec60a75@gmx.de>
Date: Wed, 10 Jun 2026 23:31:18 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 9/9] modpost: Handle malformed WMI GUID strings
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Dell.Client.Kernel@dell.com, mjg59@srcf.ucam.org, soyer@irl.hu,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@roeck-us.net, linux-hwmon@vger.kernel.org, mario.limonciello@amd.com
References: <20260610203453.816254-1-W_Armin@gmx.de>
 <20260610203453.816254-10-W_Armin@gmx.de>
 <20260610210503.u2fcxq5qnrdtcdxf@pali>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260610210503.u2fcxq5qnrdtcdxf@pali>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BQWj/nT9sgaWwq0z7QFl1F4rkF60UhQyonnfD1pGtCliQk0/NNp
 FXKtGGugMOUkIvnmHcxdW6rzWgSs8h+pPNFmtgziJKRU69bfyBR6mG45x4pcpGiQceDSYjr
 tQY5I87j4uL76tfbQTmragDvjcO1S4DgQ/vwU92ZE7VWzwttyzVTgeagAN+fi/3OFH6UrxY
 4hvS80s8FVmg6suZ0R0WA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9OaZvfpn1w4=;0C/V84UNl0ccmb59rwhO6xspgBH
 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

Am 10.06.26 um 23:05 schrieb Pali Roh=C3=A1r:

> On Wednesday 10 June 2026 22:34:53 Armin Wolf wrote:
>> Some WMI GUIDs found inside binary MOF files contain both
>> uppercase and lowercase characters. Blindly copying such
>> GUIDs will prevent the associated WMI driver from loading
>> automatically because the WMI GUID found inside WMI device ids
>> always contains uppercase characters.
>>
>> Avoid this issue by always converting WMI GUID strings to
>> uppercase. Also verify that the WMI GUID string actually looks
>> like a valid GUID.
> Hello! Maybe different idea: Would not it be better to check in
> do_wmi_entry() if all letters are really upper case?
>
> Mixing lowercase and uppercase is a mess. And if somebody blindly copy
> lowercase from MOF files to some kernel wmi driver, we can check for
> this mistake in file2alias.c and throw an error.

guid_parse() handles mixed-case GUIDs just fine, so i prefer to accept the=
m as well.

In the long term i am trying to move the whole WMI subsystem to guid_t or =
even class names
from the BMOF data.

Thanks,
Armin Wolf

>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   .../wmi/driver-development-guide.rst          |  2 +-
>>   scripts/mod/file2alias.c                      | 28 ++++++++++++++++++=
-
>>   2 files changed, 28 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/wmi/driver-development-guide.rst b/Documenta=
tion/wmi/driver-development-guide.rst
>> index 387f508d57ad..6290c448f5e7 100644
>> --- a/Documentation/wmi/driver-development-guide.rst
>> +++ b/Documentation/wmi/driver-development-guide.rst
>> @@ -54,7 +54,7 @@ to matching WMI devices using a struct wmi_device_id =
table:
>>   ::
>>  =20
>>     static const struct wmi_device_id foo_id_table[] =3D {
>> -         /* Only use uppercase letters! */
>> +         /* Using only uppercase letters is recommended */
>>            { "936DA01F-9ABD-4D9D-80C7-02AF85C822A8", NULL },
>>            { }
>>     };
>> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
>> index 4e99393a35f1..20e542a888c4 100644
>> --- a/scripts/mod/file2alias.c
>> +++ b/scripts/mod/file2alias.c
>> @@ -1253,6 +1253,8 @@ static void do_tee_entry(struct module *mod, void=
 *symval)
>>   static void do_wmi_entry(struct module *mod, void *symval)
>>   {
>>   	DEF_FIELD_ADDR(symval, wmi_device_id, guid_string);
>> +	char result[sizeof(*guid_string)];
>> +	int i;
>>  =20
>>   	if (strlen(*guid_string) !=3D UUID_STRING_LEN) {
>>   		warn("Invalid WMI device id 'wmi:%s' in '%s'\n",
>> @@ -1260,7 +1262,31 @@ static void do_wmi_entry(struct module *mod, voi=
d *symval)
>>   		return;
>>   	}
>>  =20
>> -	module_alias_printf(mod, false, WMI_MODULE_PREFIX "%s", *guid_string)=
;
>> +	for (i =3D 0; i < UUID_STRING_LEN; i++) {
>> +		char value =3D (*guid_string)[i];
>> +		bool valid =3D false;
>> +
>> +		if (i =3D=3D 8 || i =3D=3D 13 || i =3D=3D 18 || i =3D=3D 23) {
>> +			if (value =3D=3D '-')
>> +				valid =3D true;
>> +		} else {
>> +			if (isxdigit(value))
>> +				valid =3D true;
>> +		}
>> +
>> +		if (!valid) {
>> +			warn("Invalid character %c inside WMI GUID string '%s' in '%s'\n",
>> +			     value, *guid_string, mod->name);
>> +			return;
>> +		}
>> +
>> +		/* Some GUIDs from BMOF definitions contain lowercase characters */
>> +		result[i] =3D toupper(value);
>> +	}
>> +
>> +	result[i] =3D '\0';
>> +
>> +	module_alias_printf(mod, false, WMI_MODULE_PREFIX "%s", result);
>>   }
>>  =20
>>   /* Looks like: mhi:S */
>> --=20
>> 2.39.5
>>
