Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azolkn19012056.outbound.protection.outlook.com [52.103.10.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED2B4D98EF;
	Mon,  7 Sep 2026 13:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.10.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789375; cv=fail; b=P+qXBkFoEbxXffVY89IQKWgacb6FGp8HAUcWApp9D674DATRYF1DLf/73IR5MT2nu3phXco1ts264FNRNsVXliyc4ibUPYpnUQt5CnzCWG5iYY1swh8VW/T7B7BVOggdzXOm66n78wbIRDxS1FLSE5Hfwdzv5sXxBv7wqkO2e50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789375; c=relaxed/simple;
	bh=gMMOjv15yaEquSs2KqtxJiDo1MlJwSmnbsEv1MzmE1A=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uxs/d+2SCtP6lp0w0/tnIkug2DoXgVG1HANeyjtKKTuntuzzznqrrHnPlhw0tYW4/ZNAGST3j4obIkg//xYR9D0rp9NdV32Do/+RiHpb6HSVyFOoYtB6sAABw5iEgoZJKObAUB94+UVMDhWiufzxaAGEAFvF8TOnUqLvtPThP0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=meeRym2b; arc=fail smtp.client-ip=52.103.10.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="meeRym2b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=atGwlB27uMLrwLQki1ZbbNeVAMIfd1mF7UoqrVklXy8iNq2mWLoQHtlxkdaT28BTvW07GzIHbo8bstp+27saGJtJ7ogutsFAgCTIBa4CValMKs/4PyBj3NMQdI2szyyI1kljNcPjrtVPLXj2+9A0JOsEAkTEC7yjW9v0wxAnizFWf2rfi8ExUZv+8WlGrSm9D7DZEEMfv7K6qTlPy5ZW4JTzMkNJRkdVgPnkTSkrKUCub28eeXIi+GKdZHzkTriU3v50n2b01Cqd5ilNn/QtuMLPyprR/Gs9h8nF3gaX4AXFwgKgPoJqDssyvLh0sUKW4YfDF8L+hkiJiwPtFAUUVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMMOjv15yaEquSs2KqtxJiDo1MlJwSmnbsEv1MzmE1A=;
 b=ikvV6g5wxCNH/ai+jlnpZPOj+A5BsVEY6CElo/PrUmB0fkoGegUvpES0msl8Oz/KVFg4BICYP6Ndf8tZk1fK4T3lFqbqA/FNhHqSGzh7UQANqfQ82Yx7w5AKCJERdwP//R2uqyU8mReoXHW7YQP9HO6x1JGEMP34ANVlIv0bw684xl4gaL5L3bSzqBhSnWGwVoJy/e/lixSvxmYwuJCLCJiRXjgivJBs47P17s93g/D+Dj5InrSWNlySsMjdURH2V/R4YBsAuGZWUC5nrOMNuI4Qe0KzFr+GKJ34QntYAXScZqFSwB4ANFtwxp/ka8nguqYRPE0pTgKx3nC9fGmLtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMMOjv15yaEquSs2KqtxJiDo1MlJwSmnbsEv1MzmE1A=;
 b=meeRym2boED/MzwH2vil1DO2lypjP9xmVG74fUvFf5sOQzO+YXE5OydOr+Zcg1MSTe3R50oNx8XkXp4TPFSkdhuVK/Eny7XY9DAzSA50nGWDXiJefgL3pEombMI3HTdk4TdFE3NVW/Mpl0ssyT13L3MiPpuNHzZRBfVr2GUDTTexG2llkeMhWNyZMx0dMngQ/FU7dTR39F3sght146WJ7GPMFbBbksYPBoEWCmdC+8caq/BYjv0TieqUj16n/tiTcAEtZ0uBjkV2fR51gbuFXK5USqyn0Uwk+8mHOCQC9iDUgy6vMd1QMRFFgB2K6zme0sZbQnVdgEyqBABZApWMnA==
Received: from DS0PR18MB5477.namprd18.prod.outlook.com (2603:10b6:8:162::11)
 by SJ0PR18MB988518.namprd18.prod.outlook.com (2603:10b6:a03:404::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.13; Mon, 7 Sep
 2026 13:56:11 +0000
Received: from DS0PR18MB5477.namprd18.prod.outlook.com
 ([fe80::d67:de80:bff4:4306]) by DS0PR18MB5477.namprd18.prod.outlook.com
 ([fe80::d67:de80:bff4:4306%5]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 13:56:11 +0000
From: Rodrigo Hernan Villarroel <hernandevbuddy@outlook.com>
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"mradityadash@gmail.com" <mradityadash@gmail.com>, "i@rong.moe" <i@rong.moe>,
	"derekjohn.clark@gmail.com" <derekjohn.clark@gmail.com>
Subject: [RFC PATCH 3/3] platform/x86: lenovo: Add Legion Go Fan Method curve
 driver
Thread-Topic: [RFC PATCH 3/3] platform/x86: lenovo: Add Legion Go Fan Method
 curve driver
Thread-Index: AQHdPnfRc8WULaGpy0et3cchy+FZnbbDHeYD
Date: Mon, 7 Sep 2026 13:56:11 +0000
Message-ID:
 <DS0PR18MB5477DEB7537E814909B41586DBB22@DS0PR18MB5477.namprd18.prod.outlook.com>
References:
 <DS0PR18MB5477F22D326C79451CCB21CADBB22@DS0PR18MB5477.namprd18.prod.outlook.com>
In-Reply-To:
 <DS0PR18MB5477F22D326C79451CCB21CADBB22@DS0PR18MB5477.namprd18.prod.outlook.com>
Accept-Language: es-AR, es-ES, en-US
Content-Language: es-AR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR18MB5477:EE_|SJ0PR18MB988518:EE_
x-ms-office365-filtering-correlation-id: a6dd4079-13f8-4d4e-a62f-08df0ce7c67e
x-microsoft-antispam:
 BCL:0;ARA:14566002|24121999003|22091999003|15080799012|6140399003|8062599012|8060799015|19110799012|15030799006|19101099003|31061999003|51005399006|440099028|3412199025|102099032|40105399003|3430499035|2607281247196008|26121999007;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?kJAU8PZCpcjtgisAKSZHilqm8/8yXaONMrRYD6H1i9oG7+ujgNWlE6NI?=
 =?Windows-1252?Q?VjLMH9y8C5MaLipyC7p7ZTByO5JfvYJd8vyWL0LaqjhYmNUexW5GumKS?=
 =?Windows-1252?Q?hMSQnu2UNiP/YpfDcF2VFeAJgfbOm0/+l+khkTRG/pAjBI/G2odWf6pt?=
 =?Windows-1252?Q?cG999w40YXAlFXZKpPaBsQzShLjgw/UAqRXiLF/j2FJQUWIOovULnoF7?=
 =?Windows-1252?Q?/bNE3D9HDZvGxccr/CjSA98SqzbtPPA1ywgzocs3FSJ+n5eqt6fdefDL?=
 =?Windows-1252?Q?r32C0CqAW/c8+OLNyoEHsCGh/JvGBXRB3i+4tEwpaQpLwBg1fM2l8yYW?=
 =?Windows-1252?Q?8S+sbUD/sHJMFxt06ieXv8ZjB995j1FVSpkjgIzOQJqQAlUAx0h/z/xC?=
 =?Windows-1252?Q?mThd/i4RXSlz34/zwyhUX063okHHcV9dprnjCtGdjBTgdfPnzqu+ieUi?=
 =?Windows-1252?Q?smoczj4I2PP1gmllKlUQBbSz+P7yxVg1ZyI83IAd7AqTx5+wVG6gVHUS?=
 =?Windows-1252?Q?Kqg4U6bGMu4dW3Va2cDOB609J2xrmZplCwTqlvOowmCas45vAKL2G+/I?=
 =?Windows-1252?Q?X3m5mQUvcsnKwmDDOV+gnAd+DLj6+pi8eRwmxWHcuJUqh7sVYc0QP+49?=
 =?Windows-1252?Q?bJoyrRjNzHwFzNDnOKYN3kaXbo1wzRleISRym6ZuNe3aZ/mXkdd5TA4G?=
 =?Windows-1252?Q?qlzUvkqq2ARcvu+kXu59A9OgVIh+ZLhkwBmpBYjAZpbVNO4mPyaT4PpK?=
 =?Windows-1252?Q?AkCkheAvWiJEQL5xcFLIZ3B3gqMbYCpvWZwzsKTAejXKoAZi5thNakKS?=
 =?Windows-1252?Q?7e7Yr8gyByvadLbxxxBQRIgiLVzAmcy4ZJoYINwsamMiA7OWguAhwv0S?=
 =?Windows-1252?Q?KWFq/kSFWJbIsZMXZ2fmz6Ykr2/z7iwnLmMGpPIqxWB49anc4Fdqmakn?=
 =?Windows-1252?Q?ownGU/bnvkNqJbROAatGR5f3ozWsxQhXsd5dmcZ28kT7dcX8AmT74hco?=
 =?Windows-1252?Q?YYPQuqNftSAJJe8Eifvrrp1pbulbdeAhJ/coHL8i3bVEfmtBWuwDmIAz?=
 =?Windows-1252?Q?DzBKeNPikcxySFoZsLoWE3oGaw5B6Z4KBrL8x46x1fSeq3LqD8CRAJOA?=
 =?Windows-1252?Q?dH5LIdOXs2zkySmUtJEFXHd4?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?UHCP4vs9oTuL0z6/rW3fn4j9sO0enGyNJstwKyx0dushOC2RmokbTKM5?=
 =?Windows-1252?Q?Ptj/LEYtLL7WpNKkWmEKQcDDUS5f6HZX239SV8RDdHHmkUS20xGfcqhF?=
 =?Windows-1252?Q?hPsxTrMk9jab6v+4+OBZkSZdfnGrx2gpU8wf+6Sb+JvbaOQQbZ3X6s3Z?=
 =?Windows-1252?Q?WoxLRSWfzW7NNjAeoMgT+pAGYDjBvlXVcQaIXhBCi4V30+YZnrQH9VPx?=
 =?Windows-1252?Q?AxkV0i45h+C3Zv9T7mKQJMOVrM6kCZCn55nbgiMjEyFSu9xb1e8WKBkH?=
 =?Windows-1252?Q?5uIAyenIH/fhfzNcKb5hmts3wkhrgefMoUgEffr50uRI4rUOxcYnPB1H?=
 =?Windows-1252?Q?/NtKDTHDZaMC4+bbcTLscyVj2uJTJHHeGCc2877LRuQVp1uxSLx7Nhqf?=
 =?Windows-1252?Q?+Ctn/9u+o4NlZZCkcmkqCS0EwAWFI9h5xN8CjWbCrep2jUKhw6qRHpPD?=
 =?Windows-1252?Q?gQBssqXLgj/6qk2ZQtsz5Bi3AruqfnTxuj87ScMuw+1xBVCu0FblQu0h?=
 =?Windows-1252?Q?KY1oCKlZAmvIkr8yIlA2yK6Y9CGeANKp2emtL4NbGYCcZ7bik7JadOCp?=
 =?Windows-1252?Q?3bQc15/MMe9T7gcxSFil/6h4lSA/OCaUhrJ6x1ZlQPbwrDKYmRUl5ep7?=
 =?Windows-1252?Q?L0fo6bngnPcTpSPbDvZSnhNT6N3wtaza1a6jG+MCImNKrWs4zYIvYczR?=
 =?Windows-1252?Q?G/wgeGugRhrRhj7eUjaQHIw39+6itckfXwdds17McKm3yzZdLtzQ8Ko2?=
 =?Windows-1252?Q?dadUP0zarLitphRqAiotaRk2z1JgNMhOtdEfLlc2FWNI3UB2WlZPxsPy?=
 =?Windows-1252?Q?B9n1t6sHUDDepiOloCC/6apcuA0bIZ/2MntoQUx8qBa0n1b2QVsx+ic7?=
 =?Windows-1252?Q?QzW1yQXEPyQj2RNPszU/T4VhSn6HjQpPw2VJ6vXbpr3iey1GRR5L7mNh?=
 =?Windows-1252?Q?cgX0R83/MIEeeXBRIn85kmEhaM9dmTbMZbjO1Hzcsx8CKRSayEYmR+0q?=
 =?Windows-1252?Q?oWqlC/0xHuR/RS9Esa7v87omGEPQ0sal61rx4LNcKgogZn+6wwedatmi?=
 =?Windows-1252?Q?9PUTYYbRwd33X/ypoe3FH8c9Rp5V6odvNKZhmXTEclwYMQ00Emo6wQCu?=
 =?Windows-1252?Q?56bVi1vfHGb5Vi3geNftivSqKlNDZpatFXIfeRBS+Qa+hOO8ymWOvqZM?=
 =?Windows-1252?Q?7yT4VkmMkN03pU5KeYzKtRCclh5Aq3izBVwGfvLb7AGdxtGCloeIPJ5N?=
 =?Windows-1252?Q?OkauAoe04Y3R1nA4w7EJXaQ7Tr6yYx6LKni+Mn3q47rMM/aArXTb01Lm?=
 =?Windows-1252?Q?mOFjtSEv5ZNNpETTrwGVyoBT3Sy2TNix2Gn2RL4qq3bdp3c4Te96Sfyi?=
 =?Windows-1252?Q?vwar8O0RHl3MC7Cv+rC36VjOtCQCVFR2Gfe2gVCKp04tVQYx7tGTMkXX?=
 =?Windows-1252?Q?BAqmx/KndeG86wZ1cXjGEnafvyvLEQo9EipLHFExMb/u0nApDkgLyeHv?=
 =?Windows-1252?Q?Ayah2Rl1?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR18MB5477.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a6dd4079-13f8-4d4e-a62f-08df0ce7c67e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2026 13:56:11.7042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR18MB988518

Hi Aditya, Derek, Rong,=0A=
Resending this message in plain text because the original version was rejec=
ted by some mailing-list recipients due to HTML formatting.=0A=
I=92m working on a project called Easy Hardware Control (EHC), a Windows de=
sktop hardware discovery, diagnostics and safe-control platform.=0A=
The long-term goal is not to hardcode support for individual laptop models,=
 but to discover the capabilities that each system actually exposes, unders=
tand the appropriate OEM/firmware interfaces for that platform, validate wh=
at is readable/writable, and then build diagnostics and safe configuration =
profiles from that evidence.=0A=
While reverse-engineering the current Lenovo Vantage stack on a Lenovo LOQ =
15 (machine type 83GS), I found what may be a useful example of the =93same=
 GUID, different table layout=94 case discussed in this RFC.=0A=
System:=0A=
Lenovo LOQ 15 / machine type 83GS=0A=
BIOS: NECN50WW=0A=
The machine exposes:=0A=
LENOVO_FAN_METHOD=0A=
InstanceName =3D ACPI\PNP0C14\GMZN_0=0A=
Fan_Set_Table(FanTable UInt8[64])=0A=
By tracing Lenovo Vantage=92s Gaming.CustomMode.dll, I captured the exact 6=
4-byte buffer submitted to Fan_Set_Table and then independently reproduced =
the write through WMI.=0A=
Observed write layout on this system:=0A=
offset 0x00: 02 01=0A=
offset 0x02: LE32 point count =3D 10=0A=
offset 0x06: ten LE16 discrete fan-level values=0A=
offset 0x1A..0x3F: zero=0A=
Example:=0A=
02 01 0A 00 00 00 03 00 0A 00 0A 00 ...=0A=
I experimentally mapped the Vantage slider levels on this machine as:=0A=
1 =3D 0 RPM=0A=
2 =3D 1400 RPM=0A=
3 =3D 1700 RPM=0A=
4 =3D 1900 RPM=0A=
5 =3D 2200 RPM=0A=
6 =3D 2500 RPM=0A=
7 =3D 3100 RPM=0A=
8 =3D 3500 RPM=0A=
9 =3D 4800 RPM=0A=
10 =3D 4800 RPM=0A=
I also independently replayed a Vantage-generated Fan_Set_Table buffer.=0A=
With Vantage initially configured at level 2 / 1400 RPM for the first point=
, changing only that value from:=0A=
02 00 -> 03 00=0A=
through my own WMI probe changed the reported CPU/GPU fan speed to 1700 RPM=
.=0A=
Lenovo Vantage subsequently reflected the 1700 RPM value, and the setting p=
ersisted across a Windows reboot.=0A=
This machine also exposes populated LENOVO_FAN_TABLE_DATA instances with fa=
n/sensor-specific RPM and temperature tables.=0A=
I noticed that the RFC=92s Legion Go layout contains additional temperature=
/trailer data after the control values, while Vantage on this LOQ sends zer=
os for the remainder of the 64-byte buffer. This appears to be a concrete e=
xample of a different Fan Method layout behind the same general interface.=
=0A=
For EHC, I am especially interested in capability discovery rather than mod=
el-specific hardcoding.=0A=
If you are able to share or point me toward any public or redistributable i=
nformation concerning Lenovo platform interfaces, I would be very intereste=
d in learning about:=0A=
known LENOVO_FAN_METHOD / LENOVO_OTHER_METHOD layout variants;=0A=
the meaning of the first bytes in these payloads;=0A=
WMI GUIDs and method variants used across Lenovo platform generations;=0A=
capability / feature IDs and their semantics;=0A=
reliable ways to identify which interface or payload schema applies to a sy=
stem;=0A=
valid ranges, enumerations and dependencies for writable capabilities;=0A=
how LENOVO_FAN_TABLE_DATA and other Capability Data classes are intended to=
 be interpreted;=0A=
broader platform capabilities covering thermals, CPU/GPU power, display, ba=
ttery/power modes, sensors and other firmware-controlled features.=0A=
I am not looking for confidential Lenovo material. Public documentation, re=
distributable specifications, source references, known mappings, or guidanc=
e on how the firmware advertises these capabilities would already be extrem=
ely valuable.=0A=
I would also be happy to contribute data back.=0A=
I can provide:=0A=
WMI class/schema dumps;=0A=
Capability Data dumps;=0A=
raw 64-byte Fan_Set_Table captures;=0A=
exact full 64-byte payloads with the corresponding Vantage UI states;=0A=
DMI/BIOS information;=0A=
Vantage component/version information;=0A=
controlled read/write experiments;=0A=
persistence tests;=0A=
comparisons across BIOS versions;=0A=
testing on hardware I have physical access to.=0A=
The goal of EHC is to build a discovery-driven compatibility layer that res=
pects the interfaces and constraints intended by the hardware/OEM, rather t=
han relying on unsafe generic tweaks or undocumented assumptions.=0A=
If this data is useful for the Linux Lenovo work, I=92m happy to perform ad=
ditional controlled tests on the 83GS as well.=0A=
Thanks,=0A=
Hern=E1n=0A=
Easy Hardware Control=0A=
hernandevbuddy@outlook.com=
