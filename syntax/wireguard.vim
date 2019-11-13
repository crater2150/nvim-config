" Vim syntax file
" Language:	Wireguard config
" Original:	crater2150 <vim@qwertyuiop.de>

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn region wgInterface
      \ start="^\[Interface]$"
      \ end="^\["me=s-1,re=s-1
      \ contains=wgInterfaceHead,wgPrivateLine,wgInterfaceField,wgIp,wgPort
syn region wgPeer   start="^\[Peer]$" end="^\["me=s-1,re=s-1
      \ contains=wgPeerHead,wgPeerField,wgIp,wgPort

syn keyword wgInterfaceHead Interface
syn keyword wgPeerHead Peer

syn keyword wgInterfaceField Address ListenPort FwMark
syn keyword wgPeerField
      \ PublicKey
      \ PresharedKey
      \ AllowedIPs
      \ EndPoint
      \ PersistentKeepalive

syn match  wgComment  "[#].*$"

syn match wgPrivateLine /^\s*PrivateKey = .*$/ contains=wgPrivateKey,wgPrivateKeyField
syn match wgPrivateKey /=.*$/ms=s+1 contained conceal cchar=
syn keyword wgPrivateKeyField PrivateKey

syn match wgIp "\([0-9]\{1,3}\.\)\{3}[0-9]\{1,3}\(/\d\d\?\)\?"
syn match wgPort ":\?[0-9]\{1,5}"

hi def link wgInterfaceHead   Special
hi def link wgPeerHead        Special
hi def link wgInterfaceField  Type
hi def link wgPeerField       Type
hi def link wgPrivateKeyField Type
hi def link wgIp              Number
hi def link wgPort            Number

let b:current_syntax = "wireguard"

" vim: sts=2 sw=2 et
