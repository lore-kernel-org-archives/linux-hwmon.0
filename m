Received: from FR4P281CU032.outbound.protection.outlook.com (mail-germanywestcentralazon11022131.outbound.protection.outlook.com [40.107.149.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA4A285C88;
	Tue, 17 Mar 2026 04:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.149.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773721247; cv=fail; b=X4SSz5s5nuqzU0JJXLhagpyr75a2ImNfLAeSt+DNE5ybyVkIDFoMw/HG1Y3WjfwCg/56Eh8jli+Rw5kvozVCwSr7Q8XPFpLH5t8K7Rspxk6uMIPF+xxf2ccCCY+sAv65YNgLhY0XN7wsp/Hyp+Y2K3XfpDut6aWdCYUiabG8Ot4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773721247; c=relaxed/simple;
	bh=t5v8G+YluIR5bAYONe3nzHhmawV/q1Np8gvH3Xj7c1Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KR5+waJaT31zXODTVSypAOofC7gpdcA7VUPUq3A3tbfQf9xQTUwRzeAAdt+cE6M2r8sNtkp7ObNxmZfBTDLPB0YxzyAXwPubzfRtopHbfPnjcn+P7EcST8kg7dfx7L9Uh/a/wX0DUYiwiDN5j6F2gCJY7U6AFGLcWfjf0fAiwy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arctic.de; spf=pass smtp.mailfrom=arctic.de; dkim=pass (2048-bit key) header.d=Arctic.de header.i=@Arctic.de header.b=IZo8BgiK; arc=fail smtp.client-ip=40.107.149.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arctic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arctic.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Arctic.de header.i=@Arctic.de header.b="IZo8BgiK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y2U71poJ3BXkL7T8TYuuVXEM5jiFuwajTIYzgVaxTYmoysdxtmrr0e7vNItyHyPf+cKRloTvgHjlnWYmXACTQZ2tnyQIw0yADjwLvbht67lc4nAxHK2lqFM8r8QJeu2PVyvS+tEPOT1Fn83cB1gpDiBB1W3U94ADdjvPK5hNF7YQeUl3cawJ/qip3UKttjksxyI8JsuPT8g0GR6DmUd20ApkuN6mLTum00esuaxY7wI69TTrEBBc60QX4FlMsuveq+5JW3Toy4xJmAvuCg61cr9ILlImYYu5HWJxMrmIHhXxmAc6EBT66Rf0uAd4BnTJ0SFuwcfIgiSv+9X/QX7Ssg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XpHKoBBWug6EUhR8VVqP2UEcwGchWSzt8K+EZE794UE=;
 b=l2rYm8k/8qlFLZF4UNNm8smfTtK4rKLpa1NR3VF9n7vfhW3+wCabc9y7ecrSi93iLN6LH6/fzao6sRLF+KrnxRis+OvQAupQaC+pIXuOowoA/GkHlvR6GutAK1NEkGnzFSDxqFLf3dXJA+w+tvk1JyEK0G2QLNFoFX9FnDKzY5VE5rmTPUi7U0VIa4JnHF/Z8ku8Nzl886Q95UUvyfxe05rLdLdYQv2uPQYZtI8zcv6G4VCS9kXUo9PawcHExs4RerEiWt5D3GB6J5bIYlJ7T2HmkD35nWgGUg0Lo2jXeK3xZbHQJ/S01cQhcMAB22/8Jmzy4fRCiRWTkmhp7kYBxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arctic.de; dmarc=pass action=none header.from=arctic.de;
 dkim=pass header.d=arctic.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Arctic.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpHKoBBWug6EUhR8VVqP2UEcwGchWSzt8K+EZE794UE=;
 b=IZo8BgiKG+hMaVaExcUaT9d6RtvujPvyV37pay6X1b/WqOzYTjR8nuKalgppwJNAXAZzMqsLUfnWbGl/jFRISnlTStmI1UtS74zssGkB6k6VbN/XsQHMJ6yINzs1QbDTVxmTBUW4QaeMFXnRrCqlYCeT6b8kctNVXWXexsb3uRFtuHNal+eI108e27NCaZuxJQBo+K7cTPpwPGhcq0IADIvXFG6bCF2vebTzOlZB/gTVI8FQ8hLuS8CAyPx2gWW1lx98eFLc3JaJFwMzq9Fi/Dp1KN5rZOhcHl3BYBdsyvC8mZ2T5zMfa0eIosXrmku52hmWg6AOlvxDzV8Qod7KFQ==
Received: from FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1bf::9)
 by FRYP281MB1995.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:46::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Tue, 17 Mar
 2026 04:20:39 +0000
Received: from FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM
 ([fe80::7eba:ac95:a60d:521c]) by FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM
 ([fe80::7eba:ac95:a60d:521c%5]) with mapi id 15.20.9700.024; Tue, 17 Mar 2026
 04:20:39 +0000
From: Aureo Serrano <aureo.serrano@arctic.de>
To: Guenter Roeck <linux@roeck-us.net>
CC: =?iso-8859-1?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] hwmon: add driver for ARCTIC Fan Controller
Thread-Topic: [PATCH v2] hwmon: add driver for ARCTIC Fan Controller
Thread-Index: AQHcsturmfE4I1kpGEmwRyayOo/BcLWsr+sAgAVzrwY=
Date: Tue, 17 Mar 2026 04:20:39 +0000
Message-ID:
 <FR6P281MB590093105CE0A62A1A69BBFDEF41A@FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM>
References: <c6d6c506-1407-4676-b730-f9fff595bb75@roeck-us.net>
 <20260313111955.36811-1-aureo.serrano@arctic.de>
 <60ba4d74-5145-4996-a26d-b883ea67dcc9@roeck-us.net>
In-Reply-To: <60ba4d74-5145-4996-a26d-b883ea67dcc9@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arctic.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR6P281MB5900:EE_|FRYP281MB1995:EE_
x-ms-office365-filtering-correlation-id: 62b52aca-0650-417d-c041-08de83dc8bb6
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18002099003|56012099003|22082099003|55112099003;
x-microsoft-antispam-message-info:
 fKIVz+Zom3E1iuxEtL3QcTaf7pLq96RA1aQF/REpyy7Wo8i73Si7zGQSS7T9ht1ZA6UjEUtvMY/DNSueQ0Jpg6EmV70q8KcbhvP50FI9m2hjEYPPQhFRbs1UZ1rHEBwD2vERMNi4CIlju0RJ74P79PUPtttP3+M1ijAQTUniCaRTKj4o4u4U429VJWLeAZ/4xRogQAQbdtSGrWTZ/zeVtduug+LpHyzV0h4gLcNFPeUPPcqsrPR5puWl8i8yd8O3LDKrWmRm7JfMoqlpSxq/KxBh/VuuiD0An4Q1tJa+s6tFzUOf1S9zFnunNd3ziT9Cyj2LH1UXl/Pr0K2aaHJTinsxLKzxZTUALWNqJGKr4myus/W/xMpejwf1isvQD10yGzz9G6Ze26x7MdQrXyNLzRc6kKRyTbIrC15KFp9dOeaB2HDChtFk+eumIoZ7eZ/AQax7a1UJOxNiLIbYJW91gMijQ0Jvee9xOkDlkHtu9f6kqvF+7nTjIoRvM8TduH+w2MOJvoRj8dAzQD6xK7lqpnrDdSPOb8ITIy/Y3hHcce39JqTDRjAeGjNnD7Fd9Xwgv0ltNwsQWgh4kFXVvXvISE0Pm/WzqrFY/z+VVqVlCr2Z9uCHjlXzEXcyhbxTKM6agN4MNSQivDJ3yzDHpTCbrTcoBJ4EREV9IcRvLUETi1ZGhEjtJZ52QVn0EMwlrGKyMZoixGIuD2mqpkgriGHkKm2q1l8oITZXI+2mLi/4oVInQ9BK8pnUEibpdXqxszVRhtm8YUxtG2ECvqMuXTKaqhpiSDXbqJSAKBg4+00qZ7Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(56012099003)(22082099003)(55112099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?SeumMlGeKCezzJoJPzi+RTD8vRbb7nc3/BHuu193IMKJfNDpmHFEnlmKEC?=
 =?iso-8859-1?Q?aONW5nc/DFQ9LwwO5SiTn+kknLnVTLH8iUvYLpfqX0WYG2v33MvNBKu8nM?=
 =?iso-8859-1?Q?KuL84iCypCD7PtmZCxiAuLhCJwbForTWenqwakc5PqxASZhO+7vp5nSWY5?=
 =?iso-8859-1?Q?3zIp/juY5sq2+vBBegk2u8q8xwlpZPmqdbxIFbNduth2hTnBAmhLbY8v1X?=
 =?iso-8859-1?Q?s1yKG2nT4r5AAiXU79vf9ZvbFr5n539btvueV390kQxVBxbqmkohCtC+i6?=
 =?iso-8859-1?Q?9H+h/IXmyi+vTkooAtrtRPEItb6P4s951Trh2GPHrv67g/JI9ucUamsNRJ?=
 =?iso-8859-1?Q?LU3gHFvuBWisq5tQqg6aywo1EqHIm7mzSPvOkZwtnFfTtFw/RVCphG1uEU?=
 =?iso-8859-1?Q?/2kTSIbVe4Hcx06sIvN0wmbPul7DCOnjGe0OWXR21U8pSjhB7+A2flvWL+?=
 =?iso-8859-1?Q?LRwPiDTtwGSBISPZrgagDf8rWgFK5fLb98S+HvRo/2YCd08gOleY7HMBmM?=
 =?iso-8859-1?Q?08TpqQqMM+hDuorDDB7lyw/aPFdep/oHoWauQ0RvO5SqA6GLaBMYb9tPNY?=
 =?iso-8859-1?Q?TRphjnwBhiP2/B4Fcsa3ug11i9/XcwSWXY1H2RWPmyoLlNJYocsogVMYpH?=
 =?iso-8859-1?Q?ggK95EyMNT1T06fIs/o63htFPMigK76vrBECQGuLugoKKZ2+d894kzfwRp?=
 =?iso-8859-1?Q?I/di6cpDQ7nGT2rNleCGW5xctEi2Qw4G4hfYd18O6wHc+yVYxrm98LbbKi?=
 =?iso-8859-1?Q?DW5uCXGSBs36L86Lri1yWXG6+O1muXPWxFqGIN4siOlvMfbK0ZUcesMgIN?=
 =?iso-8859-1?Q?OPLokSlJfPLOfQQHO7dQKBBv5mO9245iBQqRNF+Uf15712WH6tN0j838Ih?=
 =?iso-8859-1?Q?6ZdEqsDsoTBaQIafiT9tgCMS6yii9BWFO8JnpPSLPIKSSl4lv20iMx7rUh?=
 =?iso-8859-1?Q?6wMpFjHwflghizKEUrqlNLrSU+FhJTY6woFrMLff63UJPE3noo/YT6/ukh?=
 =?iso-8859-1?Q?Rg7F+CTmAthZhSHg1Nvx3HfmXKipy0163OZI/AG43FCNFTU+FzTegbkVa9?=
 =?iso-8859-1?Q?fi55zCYoZ3QhnWgRLP1eL17jYYFqxo2wqeLt6j8mmtOXzl5wTQvuZ/dMOJ?=
 =?iso-8859-1?Q?75ohpGZovlh3EJtr0YipvSBIITKy9zV3r2VoM9VLAd2da/5uBFJwY5fG8l?=
 =?iso-8859-1?Q?xBQ1+S8FNINEWYM7+m92qczXHthIOjwVokC6yaWoMObdBOoUjbi8n3VLg1?=
 =?iso-8859-1?Q?cOPm85D6y9/Qv7HxDe4kpBtH6VcmhB34mc5o/quOXO/DEbG2Uh4eati//X?=
 =?iso-8859-1?Q?r2GbxHzVVbKn/4vXcvrWuP70FHu1ObWb/tGqMTbx6rIBpkjeb9uUAmc6cj?=
 =?iso-8859-1?Q?r8HjiXhMVokw7tyLwoC5nPFe3SD5eEmMoYZlFRbL4T5s4yiSFwis8+3TNR?=
 =?iso-8859-1?Q?PNS2XgvFAJVskDjiUHDJ3RacTQLbyx8YZOcJMMO4dazaaQCCGPs1UndT8/?=
 =?iso-8859-1?Q?SHKkUscTgOGdk8/6WmlK1frwzldrl7qYBdNoSOFSt3HUXL8FgHKOjLiqsC?=
 =?iso-8859-1?Q?h8nIjlp+COBR6l/J0W0SyqPtTYlnwUt3Qw1XYATaxS8RvY47zFJ4KS+vz4?=
 =?iso-8859-1?Q?JRfkY5B2zkqpFuLg6ozeYcZ0KNYxaUmJMjeFARYMRRpvXMn5h7wIJwyszJ?=
 =?iso-8859-1?Q?B2E1PlL+fIsci1mrLRyVUzl9fGXfZQkmC0mH3joSZ3crHDn6CSh/lJR0W5?=
 =?iso-8859-1?Q?hZhAunPK1xJw1l1sWeWtDa7ua/Ax85m74dJnoQz5YcVrjNceNCwrQhzc1f?=
 =?iso-8859-1?Q?BgY2LVWTKA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Arctic.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b52aca-0650-417d-c041-08de83dc8bb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 04:20:39.3118
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 51cc2c5f-af21-4667-81ec-d88d36e264bb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wRSQLiGROdaz5lYBnqkkETJIt11B2Wc4kTh+vofKGvd7Xsnahp+aaB8dgt0P4Zs2GZkPwm4nHkK68fz5jkxs8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRYP281MB1995

On 2026-03-13 09:59:56-0700, Guenter Roeck wrote:=0A=
> > +	buf =3D kmalloc(ARCTIC_REPORT_LEN, GFP_KERNEL);=0A=
> > +	if (!buf)=0A=
> > +		return -ENOMEM;=0A=
>=0A=
> The second problem does not exist since the hwmon core serializes sysfs=
=0A=
> attribute accesses, and a single once-allocated buffer would be sufficien=
t=0A=
> for the same reason.=0A=
=0A=
Moved the buffer into the struct (u8 buf[ARCTIC_REPORT_LEN]), allocated=0A=
once via devm_kzalloc with the rest of the struct. Per-write kmalloc/kfree=
=0A=
removed. Does that match what you had in mind?=0A=
=0A=
> > +	{=0A=
> > +		guard(mutex)(&priv->lock);=0A=
> >=0A=
> The { } around the guard() are unnecessary, both here and elsewhere in=0A=
> the code.=0A=
>=0A=
> If the guard() is added is because the call is from an event handler,=0A=
> use hwmon_lock() and hwmon_unlock() to serialize accesses.=0A=
=0A=
Braces removed. arctic_fan_parse_report() now uses hwmon_lock()/=0A=
hwmon_unlock() as suggested.=0A=
=0A=
One consequence worth checking: since read and write callbacks are already=
=0A=
invoked with the hwmon core lock held, keeping a separate private mutex=0A=
alongside hwmon_lock() would protect the same data with two different locks=
.=0A=
I removed the private mutex entirely instead of converting it with=0A=
devm_mutex_init(). Is that the right conclusion, or would you prefer keepin=
g=0A=
the mutex?=0A=
=0A=
> > +	mutex_init(&priv->lock);=0A=
>=0A=
> Use devm_mutex_init().=0A=
=0A=
Addressed as described above.=0A=
