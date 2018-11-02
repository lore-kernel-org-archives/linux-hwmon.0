Return-Path: <Brian.Woods@amd.com>
Return-path: <Brian.Woods@amd.com>
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
	"x86@kernel.org" <x86@kernel.org>, Clemens Ladisch <clemens@ladisch.de>, Jean
 Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Bjorn
 Helgaas <bhelgaas@google.com>, "Woods, Brian" <Brian.Woods@amd.com>, Pu Wen
	<puwen@hygon.cn>, Jia Zhang <qianyue.zj@alibaba-inc.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: [PATCH 0/4] Update DF/SMN access and k10temp for AMD F17h M30h
Date: Fri, 2 Nov 2018 18:11:02 +0000
Message-ID: <20181102181055.130531-1-brian.woods@amd.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>

Updates the data fabric/SMN code needed to get k10temp working for M30h.
Since there are now processors which have multiple roots per DF/SMN
interface, there needs to some logic which skips N-1 root complexes per
DF/SMN interface.  This is because the root complexes per interface are
redundant (as far as DF/SMN goes).  These changes shouldn't effect past
processors and, for F17h M0Xh, the mappings stay the same.

Brian Woods (4):
  k10temp: x86/amd_nb: consolidate shared device IDs
  x86/amd_nb: add support for newer PCI topologies
  x86/amd_nb: add PCI device IDs for F17h M30h
  hwmon: k10temp: add support for AMD F17h M30h CPUs

 arch/x86/kernel/amd_nb.c | 50 ++++++++++++++++++++++++++++++++++++++++----=
----
 drivers/hwmon/k10temp.c  | 10 ++--------
 include/linux/pci_ids.h  |  3 +++
 3 files changed, 47 insertions(+), 16 deletions(-)

--=20
2.11.0
